require './controller/rentalactions'
require './controller/personactions'
require './controller/bookactions'

class UiApp
  def initialize(books, people)
    @rentals = RentalActions.new(books, people)
    @people = PersonActions.new(people)
    @books = BookActions.new(books)
  end

  def options
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

  def do_action(option)
    case option
    when 1
      @books.read_all
    when 2
      @people.read_all
    when 3
      @people.create
    when 4
      @books.create
    when 5
      @rentals.create
    when 6
      @rentals.read_all
    end
  end
end
