require 'test_helper'

class BrowsingTest < ActionDispatch::IntegrationTest
  fixtures :developers, :suppliers, :games, :games_suppliers

  test "browse" do
    jill = new_session_as :jill
    jill.index
    jill.second_page
    jill.game_details 'Pride and Prejudice'
    jill.latest_games
  end

  module BrowsingTestDSL
    include ERB::Util
    attr_writer :name

    def index
      get '/catalog/index'
      assert_response :success
      assert_select 'dl#games' do
        assert_select 'dt', :count => 5
      end
      assert_select 'dt' do
        assert_select 'a', 'The Idiot'
      end
      check_game_links
    end

    def second_page
      get '/catalog/index?page=2'
      assert_response :success
      assert_template 'catalog/index'
      assert_equal Game.find_by_name('Pro Rails E-Commerce'),
                   assigns(:games).last
      check_game_links
    end

    def game_details(name)
      @game = Game.where(:name => name).first
      get "/catalog/show/#{@game.id}"
      assert_response :success
      assert_template 'catalog/show'
      assert_select 'div#content' do
        assert_select 'h1', @game.name
        assert_select 'h2', "por #{@game.developer.name}"
      end
    end

    def latest_games
      get '/catalog/latest'
      assert_response :success
      assert_template 'catalog/latest'
      assert_select 'dl#games' do
        assert_select 'dt', :count => 5
      end
      @games = Game.latest(5)
      @games.each do |a|
        assert_select 'dt' do
          assert_select 'a', a.name
        end
      end
    end
  end

  
def rss
    get '/catalog/rss'
    assert_response :success
    assert_template 'catalog/rss'
    assert_match "application/xml", response.headers["Content-Type"]
    assert_select 'channel' do
        assert_select 'item', :count => 5
    end
    @games = Game.latest(5)
    @games.each do |game|
        assert_select 'item' do
            assert_select 'tittle', game.name
        end
    end
end

    
    
    
  def check_game_links
    for game in assigns :games
      assert_select 'a' do
        assert_select '[href=?]', "/catalog/show/#{game.id}"
      end
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(BrowsingTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
