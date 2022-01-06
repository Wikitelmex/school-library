require_relative './actions'
require_relative '../model/rental'
require_relative '../model/book'
require_relative '../model/person'
require_relative '../view/rentalview'

class RentalActions
  include Actions

  def initialize(books, people)
    @people = people
    @books = books
  end

  def read_all
    print 'Enter the ID of the person you want to see the rentals of:'
    id = gets.chomp.to_i

    RentalView.list_rentals(id, @people)

    wait
  end

  def create
    rent = RentalView.new_rental(@people, @books)
    return if rent.nil?

    Rental.new(rent[:time], rent[:book], rent[:pep])
  end
end
