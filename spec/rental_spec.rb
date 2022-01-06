require_relative '../model/rental'
require_relative '../model/book'
require_relative '../model/teacher'

describe Rental do
  before :each do
    @teacher = Teacher.new(30, 'math', 'Ahmed')
    @book = Book.new('Title', 'Author')
    @rental = Rental.new('2022-01-06', @book, @teacher)
  end

  it 'shows instance of Rental' do
    expect(@rental).to be_instance_of Rental
  end

  it 'matches date' do
    expect(@rental.date).to match '2022-01-06'
  end

  it 'matches the book title' do
    expect(@rental.book.title).to match 'Title'
  end

  it 'matches the person name' do
    expect(@rental.person.name).to match 'Ahmed'
  end
end
