require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get pages_main_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end

  test "should get menu" do
    get pages_menu_url
    assert_response :success
  end
end
