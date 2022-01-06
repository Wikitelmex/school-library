require_relative './person'
require_relative './classroom'

class Student < Person
  def initialize(age, name = 'unknown', id = nil, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
  end

  def setclassroom(classroom)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_s
    "[Student] #{super}"
  end

  def to_json(_options = {})
    {
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission,
      'classroom' => @classroom
    }
  end
end
