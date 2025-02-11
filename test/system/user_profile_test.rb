require "application_system_test_case"

class UserProfileTest < ApplicationSystemTestCase
  def setup
    @user = users(:one)
    sign_in @user
  end

  test "should display borrowed books" do
    visit user_path 
    assert_selector "h2", text: "Profile Information"
    assert_selector "p", text: "Email: #{@user.email}"
    assert_selector "h1", text: "My Borrowed Books"
    if @user.borrowings.any?
      @user.borrowings.each do |borrowing|
        assert_text borrowing.book.title
        assert_text borrowing.book.author
        assert_text borrowing.book.isbn
      end
    else
      assert_text "You haven't borrowed any books yet."
    end
  end
end
