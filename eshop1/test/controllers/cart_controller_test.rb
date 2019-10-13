require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  fixtures :developers, :suppliers, :games

  test "add" do
    assert_difference(CartItem, :count) do
      post '/cart/add', :params => { :id => 4 }
    end
    assert_response :redirect
    assert_redirected_to :controller => 'catalog'
    assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
  end

  test "remove" do
    post '/cart/add', :params => { :id => 4 }
    assert_equal [Game.find(4)], Cart.find(@request.session[:cart_id]).games

    post '/cart/remove', :params => { :id => 4 }
    assert_equal [], Cart.find(@request.session[:cart_id]).games
  end

  test "clear" do
    post '/cart/add', :params => { :id => 4 }
    assert_equal [Game.find(4)], Cart.find(@request.session[:cart_id]).games

    post '/cart/clear'
    assert_response :redirect
    assert_redirected_to :controller => 'catalog'
    assert_equal [], Cart.find(@request.session[:cart_id]).games
  end
  
test "add_xhr" do
assert_difference(CartItem, :count) do
post '/cart/add', :params => { :id => 4 }, :xhr => true
end
assert_response :success
assert_select_jquery :html, '#shopping_cart' do
assert_select 'li#cart_item_4', /Pro Rails E-Commerce 4th Edition/
end
assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
end

test "remove_xhr" do

post '/cart/add', :params => { :id => 4 }, :xhr => true
assert_equal [Game.find(4)], Cart.find(@request.session[:cart_id]).games

post '/cart/remove', :params => { :id => 4 }, :xhr => true
assert_equal [], Cart.find(@request.session[:cart_id]).games 
end

test "clear_xhr" do
    post '/cart/add', :params => { :id => 4 }, :xhr => true
    post '/cart/add', :params => { :id => 1 }, :xhr => true
     assert_equal [Game.find(4), Game.find(1)], Cart.find(@request.session[:cart_id]).games

    post '/cart/clear', :params => { :id => 4 }, :xhr => true
     assert_response :success
      assert_equal [], Cart.find(@request.session[:cart_id]).games 
end

end


