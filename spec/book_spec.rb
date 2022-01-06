require_relative '../model/book'

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
end
