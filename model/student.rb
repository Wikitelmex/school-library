require_relative './person'
require_relative './classroom'

class Student < Person
  def initialize(age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end

  def setclassroom(classroom)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
