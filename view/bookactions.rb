require_relative './actions'
require_relative '../model/book'

class BookActions
  include Actions

  def initialize(books)
    @books = books
  end

  def read_all
    @books.each_with_index { |book, index| puts "ID: #{index}, Book title: #{book.title}, Author: #{book.author}" }
    wait
  end

  def create
    puts 'Enter the info of the book you want to add:'
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    @books << Book.new(title, author)
  end
end
