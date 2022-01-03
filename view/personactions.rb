require_relative './actions'
require_relative '../model/person'
require_relative '../model/student'
require_relative '../model/teacher'

class PersonActions
  include Actions

  def initialize(people)
    @people = people
  end

  def read_all
    @people.each { |person| puts "Person name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    wait
  end

  def create
    puts 'Enter the info of the person you want to add:'
    print 'Name:'
    name = gets.chomp
    print 'Age:'
    age = gets.chomp.to_i

    puts 'Is this person a student(S) or a teacher(t)?'
    case gets.chomp.downcase
    when 's', ''
      puts 'Does this student have parent permission (y/N)?'
      person = Student.new(age, name, parent_permission: gets.chomp.downcase == 'y')
    when 't'
      puts 'Which specialization is this teacher?'
      person = Teacher.new(age, gets.chomp, name)
    end

    @people << person
    puts @people.include?(person) ? 'Person added!' : 'Person not added!'
  end
end
