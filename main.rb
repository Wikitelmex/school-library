require './uiapp'
require './model/schoollibraryentityjson'
require './model/book'
require './model/person'
require './model/rental'
require 'json'
require 'pry'

def main
  books_entity = SchoolLibraryEntity.new('books.json')
  people_entity = SchoolLibraryEntity.new('people.json')
  rentals_entity = SchoolLibraryEntity.new('rentals.json')
  books = books_entity.load(Book)
  people = people_entity.load(Person, Student, Teacher)
  rentals = rentals_entity.load(Rental, books, people)
  # binding.pry
  ui_app = UiApp.new(books, people, rentals)

  loop do
    system 'clear'
    system 'cls'

    puts 'Welcome to the library!'
    option = ui_app.options
    break if option > 6

    ui_app.do_action(option)
  end

  books_entity.save(books)
  people_entity.save(people)
  rentals_entity.save(rentals)
end

main
