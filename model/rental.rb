class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals << self unless book.rentals.include?(self)
    person.rentals << self unless person.rentals.include?(self)
  end

  def to_s
    "Date: #{@date}, Book \"#{book.title}\" by #{book.author}"
  end

  def to_json(_options = {})
    {
      'date' => @date,
      'book' => @book.to_json,
      'person' => @person.to_json
    }
  end
end
