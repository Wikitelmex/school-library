require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(23, 'math', 'Ahmed')
  end

  it 'shows instance of teacher class' do
    expect(@teacher).to be_instance_of Teacher
  end

  it 'matches teacher name' do
    expect(@teacher.name).to match 'Ahmed'
  end

  it 'matches the specialization' do
    expect(@teacher.specialization).to match 'math'
  end

  it 'matches the age' do
    expect(@teacher.age).to match 23
  end
end
