require 'pry'
class Book
  attr_reader :id
  attr_accessor :title, :author, :rentals

  def initialize(title, author, id = nil)
    @id = id || Random.rand(1..999_999)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    @rentals << Rental.new(person, self, date)
  end

  def to_s
    %{(
      Id: #{id}
      Title: #{title},
      Author: #{author}
    )}
  end

  def to_json(_options = {})
    {
      'id' => @id,
      'title' => @title,
      'author' => @author
    }
  end

  def self.to_array(my_array, *args)
    return unless my_array

    my_array.map do |obj|
      args[0].new(obj['title'], obj['author'], obj['id'])
    end
  end
end
