require_relative '../model/classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('class 1 ')
  end

  it 'match instance of student' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'match class lable' do
    expect(@classroom.label).to match 'class 1'
  end

  it 'match class students array' do
    @classroom.add_student('Ahmed')
    @student1 = @classroom.students[0]
    expect(@student1).to match 'Ahmed'
  end
end
