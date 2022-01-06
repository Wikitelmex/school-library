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
    @books.each { |book| BooksViews.list_books(book.id, book.title, book.author) }
    wait
  end

  def create
    x = BooksViews.new_book
    @books << Book.new(x.title, x.author)
  end
end
