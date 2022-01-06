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
      'book_id' => @book.id,
      'person_id' => @person.id
    }
  end

  def self.to_array(my_array, *args)
    return unless my_array

    my_array.map do |obj|
      book = args[1].find { |p| p.id == obj['book_id'] }
      person = args[2].find { |p| p.id == obj['person_id'] }
      args[0].new(obj['date'], book, person)
    end
    # binding.pry
  end
end
