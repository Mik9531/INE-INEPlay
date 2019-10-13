require 'test_helper'

class GameTest < ActiveSupport::TestCase
  fixtures :suppliers, :developers, :games, :games_suppliers

  test "failing_create" do
    game = Game.new
    assert_equal false, game.save
    assert_equal 7, game.errors.count
    assert game.errors[:name]
    assert game.errors[:developer]
    assert game.errors[:suppliers]
    assert game.errors[:developed_at]
    assert game.errors[:blurb]
    assert game.errors[:pegi]
    assert game.errors[:price]
  end

  test "create" do
    game = Game.new(
      :name => 'Ruby on Rails',
      :suppliers => Supplier.all,
      :developer_id => Developer.find(1).id,
      :developed_at => Time.now,
      :blurb => 'A great game',
      :pegi => 7,
      :price => 45.5
    )
  assert game.save
  end

  test "has_many_and_belongs_to_mapping" do
    apress = Developer.find_by_name("Apress");
    count = apress.games.count
    game = Game.new(
      :name => 'Pro Rails E-Commerce 8th Edition',
      :suppliers => [Supplier.find_by_first_name_and_last_name('Joel', 'Spolsky'),
                   Supplier.find_by_first_name_and_last_name('Jeremy', 'Keith')],
      :developer_id => apress.id,
      :developed_at => Time.now,
      :blurb => 'E-Commerce on Rails',
      :pegi => 18,
      :price => 55.5
    )
    apress.games << game
    apress.reload
    game.reload
    assert_equal count + 1, apress.games.count
    assert_equal 'Apress', game.developer.name
  end

  test "has_many_and_belongs_to_many_suppliers_mapping" do
    game = Game.new(
      :name => 'Pro Rails E-Commerce 8th Edition',
      :suppliers => [Supplier.find_by_first_name_and_last_name('Joel', 'Spolsky'),
                   Supplier.find_by_first_name_and_last_name('Jeremy', 'Keith')],
      :developer_id => Developer.find_by_name("Apress").id,
      :developed_at => Time.now,
      :blurb => 'E-Commerce on Rails',
      :pegi => 12,
      :price => 55.5
    )
    assert game.save
    game.reload
    assert_equal 2, game.suppliers.count
    assert_equal 2, Supplier.find_by_first_name_and_last_name('Joel', 'Spolsky').games.count
  end
end
