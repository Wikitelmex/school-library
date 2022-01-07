require_relative '../model/book'
require_relative '../model/person'

describe Book do
  before :each do
    @book = Book.new('Title', 'Author')
  end

  it 'shows instance of book class' do
    expect(@book).to be_instance_of Book
  end

  it 'matches title name' do
    expect(@book.title).to match 'Title'
  end

  it 'test book author to be test author' do
    expect(@book.author).to match 'Author'
  end

  it 'test add_rental methode in book class' do
    @person = Person.new(23, 'Ahmed', parent_permission: true)
    @book.add_rental(@person, '2022')
    @first_rental = @book.rentals[0]
    expect(@first_rental.book.title).to match 'Title'
    expect(@first_rental.book.author).to match 'Author'
    expect(@first_rental.person.age).to match 23
    expect(@first_rental.person.name).to match 'Ahmed'
  end
end
