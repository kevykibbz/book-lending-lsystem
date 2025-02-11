require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end
  

  test "should show user" do
    get user_path
    assert_response :success
    assert_select "h1", text: "My Borrowed Books"
  end
end
