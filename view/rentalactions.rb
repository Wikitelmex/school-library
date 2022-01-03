require_relative './actions'
require_relative '../model/rental'
require_relative '../model/book'
require_relative '../model/person'

class RentalActions
  include Actions

  def initialize(books, people)
    @people = people
    @books = books
  end

  def read_all
    system 'clear'
    print 'Enter the ID of the person you want to see the rentals of:'
    id = gets.chomp.to_i
    person = @people.find { |p| p.id == id }
    return if person.nil?

    person.rentals.each do |rental|
      puts "Book title: #{rental.book.title}, Author: #{rental.book.author}, Date: #{rental.date}"
    end

    wait
  end

  def create
    print 'Enter the ID of the person you want to add a rental to:'
    id = gets.chomp.to_i
    person = @people.find { |p| p.id == id }
    return if person.nil?

    print 'Enter the ID of the book you want to add a rental to:'
    book_id = gets.chomp.to_i
    return if @books[book_id].nil?

    Rental.new(Time.now, @books[book_id], person)
  end
end
