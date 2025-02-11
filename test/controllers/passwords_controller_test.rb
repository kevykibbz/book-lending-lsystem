require "test_helper"

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_password_path
    assert_response :success
  end

  test "should create password" do
    post password_path, params: { password: { email: 'john@example.com' } }
    assert_response :redirect
  end

  test "should get edit" do
    get edit_password_path
    assert_response :success
  end

  test "should update password" do
    patch password_path, params: { password: { current_password: 'password', new_password: 'new_password', new_password_confirmation: 'new_password' } }
    assert_response :redirect
  end
end
