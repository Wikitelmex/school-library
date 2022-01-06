require_relative './actions'
require_relative '../view/booksview'
require_relative '../model/book'
require 'pry'

class BookActions
  include Actions

  def initialize(books)
    @books = books
  end

  def read_all
    books = @books
    # binding.pry
    @books.each_with_index { |book, index| BooksViews.list_books(index, book.title, book.author) }
    wait
  end

  def create
    x = BooksViews.new_book
    @books << Book.new(x.title, x.author)
  end
end
