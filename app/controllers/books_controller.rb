class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy] 

  def index
    @books = Book.all  # No need to fetch a single book here
  end

  def show
    # @book is already set by set_book
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      flash.now[:alert] = @book.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end

  

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book was successfully updated."
    else
      flash.now[:alert] = @book.errors.full_messages.join(", ")
      render :edit, status: :unprocessable_entity
    end
  end
  

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Book deleted successfully."
  end

  private

  def set_book
    @book = Book.find(params[:id]) # This should not run for `index`
  end

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end
