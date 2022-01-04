require_relative '../model/book'
require_relative '../model/person'
require_relative '../model/student'
require_relative '../model/teacher'

class PersonView
  def self.list_people(person)
    puts "Person name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  def self.new_person
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
    person
  end
end
