require_relative '../student'

describe Person do
  before :each do
    @student = Student.new(23, 'Ahmed', parent_permission: true)
  end

  it 'shows instance of student class' do
    expect(@student).to be_instance_of Student
  end

  it 'matches student name' do
    expect(@student.name).to match 'Ahmed'
  end

  it 'matches the age' do
    expect(@student.age).to match 23
  end

  it 'matches the class' do
    expect(@student.setclassroom('room1')).to match 'room1'
  end
end
