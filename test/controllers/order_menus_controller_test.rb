require "test_helper"

class OrderMenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_menus_index_url
    assert_response :success
  end
end
