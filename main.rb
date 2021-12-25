require 'pry'
require './book'
require './person'
require './rental'
require './student'
require './teacher'

class BooksEntity
  
  def initialize
    @entity = new
    @books = []
  end

  class << self
    attr_reader :entity, :books
  end

  def create(book)
    @books.push(book)
  end
end

s1 = BooksEntity.entity
sm1 = BooksEntity
binding.pry
s1.create('book1')
s2 = BooksEntity.entity

puts s1
puts s2
