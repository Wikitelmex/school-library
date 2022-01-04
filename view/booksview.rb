require_relative '../model/book'

class BooksViews
  def self.list_books(index, title, author)
    puts "ID: #{index}, Book title: #{title}, Author: #{author}"
  end

  def self.new_book
    puts 'Enter the info of the book you want to add:'
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    Book.new(title, author)
  end
end
