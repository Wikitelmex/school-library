require_relative './person'

class Teacher < Person
  # added in testing phase
  attr_accessor :specialization

  def initialize(age, specialization, name = 'unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
