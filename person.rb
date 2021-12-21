# Description: This is a generic class for Student and Professor classes can inherit from this
#
# id: unique identifier for each person
# name: name of the person
# age: age of the person
# parent_permission: permission of the parent to make voyages, and another certain activities
#
# Examples
#
#   multiplex('Tom', 4)
#   # => 'TomTomTomTom'
#
# Returns the duplicated String.
class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..999_999)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
