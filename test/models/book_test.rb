require "test_helper"

class BookTest < ActiveSupport::TestCase
  def setup
    @book = Book.new(title: "Test Book", author: "John Doe", isbn: "1234567890")
  end

  test "should be valid" do
    assert @book.valid?
  end

  test "title should be present" do
    @book.title = " "
    assert_not @book.valid?
  end

  test "author should be present" do
    @book.author = " "
    assert_not @book.valid?
  end

  test "isbn should be present" do
    @book.isbn = " "
    assert_not @book.valid?
  end

  test "isbn should be unique" do
    duplicate_book = @book.dup
    @book.save
    assert_not duplicate_book.valid?
  end
end
