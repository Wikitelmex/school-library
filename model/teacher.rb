require_relative './person'

class Teacher < Person
  def initialize(age, specialization, name = 'unknown', id = nil)
    super(age, name, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_s
    "[Teacher] #{super}"
  end

  def to_json(_options = {})
    {
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'specialization' => @specialization,
    }
  end
end
