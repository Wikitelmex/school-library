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
require './corrector'

class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..999_999)
    @age = age
    @parent_permission = parent_permission
    @corrector_object1 = Corrector.new
    @name = @corrector_object1.correct_name(name)
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end
