require './uiapp'
require './model/schoollibraryentityjson'
require './model/book'
require './model/person'
require 'json'
require 'pry'

def main
  books_entity = SchoolLibraryEntity.new('books.json')
  people_entity = SchoolLibraryEntity.new('people.json')
  books = books_entity.load(Book)
  people = people_entity.load(Person, Student, Teacher)
  # binding.pry
  ui_app = UiApp.new(books, people)

  loop do
    system 'clear'
    system 'cls'

    puts 'Welcome to the library!'
    option = ui_app.options
    break if option > 6

    ui_app.do_action(option)
  end

  #binding.pry
  books_entity.save(books)
  people_entity.save(people)
end
# x = [{a: 123, b:'alex'},{a: , b:'adel'}]
main
