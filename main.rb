require 'pry'
require './book'
require './person'
require './rental'
require './student'
require './teacher'

def read_all_books(books)
  system 'clear'
  books.each_with_index { |book, index| puts "ID: #{index}, Book title: #{book.title}, Author: #{book.author}" }
  print 'Press enter to continue...'
  gets.chomp
end

def create_books(books)
  puts 'Enter the info of the book you want to add:'
  print 'Title:'
  title = gets.chomp
  print 'Author:'
  author = gets.chomp
  books << Book.new(title, author)
end

def read_all_people(people)
  system 'clear'
  people.each { |person| puts "Person name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  print 'Press enter to continue...'
  gets.chomp
end

def create_person(people)
  puts 'Enter the info of the person you want to add:'
  print 'Name:'
  name = gets.chomp
  print 'Age:'
  age = gets.chomp.to_i

  puts 'Is this person a student(S) or a teacher(t)?'
  case gets.chomp.downcase
  when 's', ''
    puts 'Does this student have parent permission (y/N)?'
    person = Student.new(age, name, parent_permission: gets.chomp.downcase == 'y')
  when 't'
    puts 'Which specialization is this teacher?'
    person = Teacher.new(age, gets.chomp, name)
  end

  people << person
  puts people.include?(person) ? 'Person added!' : 'Person not added!'
end

def read_all_rentals(people)
  system 'clear'
  print 'Enter the ID of the person you want to see the rentals of:'
  id = gets.chomp.to_i
  person = people.find { |p| p.id == id }
  return if person.nil?

  person.rentals.each do |rental|
    puts "Book title: #{rental.book.title}, Author: #{rental.book.author}, Date: #{rental.date}" 
  end
  print 'Press enter to continue...'
  gets.chomp
end

def create_rental(books, people)
  print 'Enter the ID of the person you want to add a rental to:'
  id = gets.chomp.to_i
  person = people.find { |p| p.id == id }
  return if person.nil?

  print 'Enter the ID of the book you want to add a rental to:'
  book_id = gets.chomp.to_i
  return if books[book_id].nil?

  Rental.new(Time.now, books[book_id], person)
end

def actions(option, books, people)
  case option
  when 1
    read_all_books(books)
  when 2
    read_all_people(people)
  when 3
    create_person(people)
  when 4
    create_books(books)
  when 5
    create_rental(books, people)
  when 6
    read_all_rentals(people)
  end
end

def ui_app
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books.'
  puts '2 - List all people.'
  puts '3 - Create a person (teacher or student).'
  puts '4 - Create a book.'
  puts '5 - Create a rental.'
  puts '6 - List all rentals for a given person id.'
  puts '7 or default - Exit'
  gets.chomp.to_i
end

def main
  books = []
  people = []

  loop do
    system 'clear'
    puts 'Welcome to the library!'
    option = ui_app
    break if option > 6

    actions(option, books, people)
  end
end

main
