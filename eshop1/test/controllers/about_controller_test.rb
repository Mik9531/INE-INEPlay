require 'test_helper'

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get '/about/index'
    assert_response :success
    assert_template 'about/index'
    assert_equal 'Sobre INEPlay', assigns(:page_title)
    assert_select 'title', 'Sobre INEPlay'
  end
end
