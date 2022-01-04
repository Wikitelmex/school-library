require 'json'
class SaveData
  def initialize(data)
    @books = data.books
    @rentals = data.rentals
    @people = data.people
  end

  def save
    people = []
    books = []
    rentals = []
    File.open('./saved_data/books.json', 'w+') do |file|
      file.write(JSON.generate(json_book(@books, books)))
    end
    File.open('./saved_data/people.json', 'w+') do |file|
      file.write(JSON.generate(json_people(@people, people)))
    end
    File.open('./saved_data/rentals.json', 'w+') do |file|
      file.write(JSON.generate(json_rentals(@rentals, rentals)))
    end
  end

  def json_rentals(array, rentals)
    array.each do |sub_arr|
      rentals << { id: sub_arr.person.id,
                   date: sub_arr.date,
                   title: sub_arr.book.title,
                   author: sub_arr.book.author }
    end
    rentals
  end

  def json_book(array, books)
    array.each do |sub_arr|
      books << { title: sub_arr[:object].title,
                 author: sub_arr[:object].author }
    end
    books
  end

  def json_people(array, people)
    array.each do |sub_arr|
      json_student(sub_arr, people) if sub_arr[:object].instance_of?(Student)
      json_teacher(sub_arr, people) if sub_arr[:object].instance_of?(Teacher)
    end
    people
  end

  def json_student(array, people)
    people << { id: array[:object].id,
                age: array[:object].age,
                name: array[:object].name }
  end

  def json_teacher(array, people)
    people << { id: array[:object].id,
                age: array[:object].age,
                name: array[:object].name,
                specialization: array[:object].specialization }
  end
end
