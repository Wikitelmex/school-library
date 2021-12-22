# Class Corrector
# Developed by: Alex Castillo
#
# Description: decorator class to decorate person class, and fix the name to starts with capital letter,
# and not longer than 10 characters
#
# Example:
#
# person_object1 = Person.new(name: "john", age: 20, parent_permission: true)
# corrector_object1 = Corrector.new(person_object1)
# person_object1.name # => "John"
#
# Date: Dec, 22 2021

require './person'

class Corrector
  def initialize(person: Person)
    person.name = correct_name(person.name)
  end

  private

  def correct_name(name)
    name = name.capitalize
    name.length > 10 ? name[0..9] : name
  end
end
