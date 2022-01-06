require_relative './actions'
require_relative '../view/personview'

class PersonActions
  include Actions

  def initialize(people)
    @people = people
  end

  def read_all
    @people.each { |person| PersonView.list_people(person) }
    wait
  end

  def create
    person = PersonView.new_person
    @people << person
    puts @people.include?(person) ? 'Person added!' : 'Person not added!'
  end
end
