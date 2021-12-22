# Class Corrector
# Developed by: Alex Castillo
#
# Description: decorator class to decorate person class, and fix the name to starts with capital letter,
# and not longer than 10 characters
#
# Example:
#  person = Corrector.new(20,"alex castillo")
#  person.name
#  => "Alex Castillo"
#
# Date: Dec, 22 2021

require './person'

class Corrector < Person
  def initialize(age, name: 'unknown', parent_permission: true)
    super(age, correct_name(name), parent_permission)
  end

  private

  def correct_name(name)
    name = name.capitalize
    name.length > 10 ? name[0..9] : name
  end
end
