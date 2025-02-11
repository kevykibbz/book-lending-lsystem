require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_session_path
    assert_response :success
  end

  test "should create session" do
    post session_path, params: { email: 'john@example.com', password: 'password' }
    assert_response :redirect
  end

  test "should destroy session" do
    delete session_path
    assert_response :redirect
  end
end
