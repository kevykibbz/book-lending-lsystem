require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should borrow a book" do
    book = books(:two)  # Use a book that is not already borrowed
    assert_difference('Borrowing.count', 1) do
      post borrowings_path, params: { book_id: book.id }
    end
    assert_redirected_to user_path(@user)
  end

  test "should not borrow an already borrowed book" do
    post borrowings_path, params: { book_id: books(:one).id }
    post borrowings_path, params: { book_id: books(:one).id }
    assert_redirected_to books_path
  end

  test "should return a book" do
    borrowing = borrowings(:one)
    assert_difference('Borrowing.count', -1) do
      delete borrowing_path(borrowing)
    end
    assert_redirected_to user_path(@user)
  end
end
