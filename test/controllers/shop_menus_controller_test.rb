require "test_helper"

class ShopMenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_menus_index_url
    assert_response :success
  end
end
