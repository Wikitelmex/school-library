# Description: This is a generic class for Student and Professor classes can inherit from this
#
# id: unique identifier for each person
# name: name of the person
# age: age of the person
# parent_permission: permission of the parent to make voyages, and another certain activities
#
# Examples
#
# person_object1 = Person.new(name: "John", age: 20, parent_permission: true)
# person_object2 = Person.new(20, "John", true)
# peron_object3 = Person.new(20, "John")
# peron_object4 = Person.new(20)
#
# Returns the duplicated String.
require_relative '../common/corrector'
require_relative './classroom'

class Person
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', id = nil, parent_permission: true)
    @id = id || Random.rand(1..999_999)
    @age = age
    @parent_permission = parent_permission
    @corrector_object1 = Corrector.new
    @name = @corrector_object1.correct_name(name)
    @rentals = []
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def to_s
    "Name: #{@name}, Age: #{@age}, ID: #{@id}"
  end

  def to_json(_options = {})
    {
      'id' => @id,
      'age' => @age,
      'name' => @name
    }
  end

  def self.to_array(my_array, *args)
    return unless my_array

    my_array.map do |obj|
      if obj.key?('specialization')
        args[2].new(obj['age'], obj['specialization'], obj['name'], obj['id'])
      else
        args[1].new(obj['age'], obj['name'], obj['id'], parent_permission: obj['parent_permission'])
      end
    end
    # binding.pry
  end

  private

  def of_age?
    @age >= 18
  end
end
