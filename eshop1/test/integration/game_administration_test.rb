require 'test_helper'

class GameAdministrationTest < ActionDispatch::IntegrationTest

  test "game_aministration" do
    developer = Developer.create(:name => 'Games of Ruby')
    supplier = Supplier.create(:first_name => 'John', :last_name => 'Anderson')
    george = new_session_as(:george)

    new_game_ruby = george.add_game :game => {
      :name => 'A new Game of Ruby',
      :developer_id => developer.id,
      :supplier_ids => [supplier.id],
      :developed_at => Time.now,
      :blurb => 'A new Game of Ruby',
      :pegi => 3,
      :price => 45.5
    }

    george.list_games
    george.show_game new_game_ruby #error

    george.edit_game new_game_ruby, :game => {
      :name => 'A very new Game of Ruby',
      :developer_id => developer.id,
      :supplier_ids => [supplier.id],
      :developed_at => Time.now,
      :blurb => 'A very new Game of Ruby',
      :pegi => 18,
      :price => 50
    }

    bob = new_session_as(:bob)
    bob.delete_game new_game_ruby
  end

  private

  module GameTestDSL
    attr_writer :name

    def add_game(parameters)
      supplier = Supplier.first
      developer = Developer.first
      get '/admin/game/new'
      assert_response :success
      assert_template 'admin/game/new'
      assert_select 'select#game_developer_id' do
        assert_select "option[value=\"#{developer.id}\"]", developer.name
      end
      assert_select "select[name=\"game[supplier_ids][]\"]" do
        assert_select "option[value=\"#{supplier.id}\"]", supplier.name
      end
      post '/admin/game/create', :params => parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/game/index'
      page = Game.all.count / 5 + 1
      get "/admin/game/index/?page=#{page}"
      assert_select 'td', parameters[:game][:name]
      game = Game.find_by_name(parameters[:game][:name])
      return game;
    end

    def edit_game(game, parameters)
      get "/admin/game/edit?id=#{game.id}"
      assert_response :success
      assert_template 'admin/game/edit'
      post "/admin/game/update?id=#{game.id}", :params => parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/game/show'
    end

    def delete_game(game)
      post "/admin/game/destroy?id=#{game.id}"
      assert_response :redirect
      follow_redirect!
      assert_template 'admin/game/index'
    end

    def show_game(game)
      get "/admin/game/show?id=#{game.id}" #cambiado de book_administration_test
      assert_response :success 
      assert_template 'admin/game/show'
    end

    def list_games
      get '/admin/game/index'
      assert_response :success
      assert_template 'admin/game/index'
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(GameTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
