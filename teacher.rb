require './person'

class Teacher
  def initialize(age, specialization, name: 'unknown')
    super(age, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
