require_relative '../model/rental'
require_relative '../model/book'
require_relative '../model/person'
require 'pry'

class RentalView
  def self.list_rentals(person_id, people)
    person = people.find { |p| p.id == person_id }
    return if person.nil?

    person.rentals.each do |rental|
      puts "Book title: #{rental.book.title}, Author: #{rental.book.author}, Date: #{rental.date}"
    end
  end

  def self.new_rental(people, books)
    print 'Enter the ID of the person you want to add a rental to:'
    id = gets.chomp.to_i
    person = people.find { |p| p.id == id }
    return if person.nil?

    print 'Enter the ID of the book you want to add a rental to:'
    book_id = gets.chomp.to_i
    book = books.find { |p| p.id == book_id }
    return if book.nil?

    { time: Time.now, book: book, pep: person }
  end
end
