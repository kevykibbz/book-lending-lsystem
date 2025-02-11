require "application_system_test_case"

class BorrowingsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @book = books(:one)
    sign_in @user
  end

  test "borrowing a book" do
    visit books_path
    if has_button?("Borrow")
      first(:button, "Borrow").click
      assert_text "Book borrowed successfully!"
    elsif has_button?("Borrowed")
      assert_selector "button[disabled]", text: "Borrowed"
    else
      flunk "Neither Borrow nor Borrowed button found"
    end
  end

  test "visiting the books index" do
    visit books_path
    assert_selector "h1", text: "Books"
    first("td a").click
    assert_selector "h1", text: @book.title
  end

  test "returning a book" do
    visit user_path(@user)
    first(:button, "Return").click
    assert_text "Book returned successfully!"
  end
end
