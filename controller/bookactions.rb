require_relative './actions'
require_relative '../view/booksview'

class BookActions
  include Actions

  def initialize(books)
    @books = books
  end

  def read_all
    @books.each_with_index { |book, index| BooksViews.list_books(index, book.title, book.author) }
    wait
  end

  def create
    @books << BooksViews.new_book
  end
end
