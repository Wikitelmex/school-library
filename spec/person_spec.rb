require_relative '../model/person'

describe Person do
  before :each do
    @first = Person.new(23, 'Ahemd', parent_permission: true)
    @second = Person.new(24, 'Adel', parent_permission: false)
    @third = Person.new(17, 'Ramadan', parent_permission: false)
  end

  it 'shows instance of person class' do
    expect(@first).to be_instance_of Person
  end

  it 'matches name' do
    expect(@first.name).to match 'Ahemd'
  end

  it 'matches age' do
    expect(@first.age).to match 23
  end

  it 'matches parent permission' do
    expect(@first.can_use_services?).to match true
  end

  it 'matches parent permission for second' do
    expect(@second.can_use_services?).to match true
  end

  it 'matches parent permission for second' do
    expect(@third.can_use_services?).to match false
  end
end
