class BorrowingsController < ApplicationController
  before_action :require_login

  def create
    book = Book.find(params[:book_id])
    if book.borrowings.exists?
      redirect_to books_path, alert: "This book is already borrowed."
    else
      borrowing = current_user.borrowings.new(book: book, due_date: 2.weeks.from_now)
      if borrowing.save
        redirect_to user_path(current_user), notice: "Book borrowed successfully!"
      else
        redirect_to book_path(book), alert: "Could not borrow book."
      end
    end
  end

  def destroy
    borrowing = current_user.borrowings.find(params[:id])
    borrowing.destroy
    redirect_to user_path(current_user), notice: "Book returned successfully!"
  end
end
