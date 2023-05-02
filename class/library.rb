require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './rental'
require_relative "./readandwrite"

class Library

  include Write
  attr_accessor :people, :rentals, :books

  def initialize
    @people = read_item('people.json')
    @books = read_item('books.json')
    @rentals = read_item('rentals.json')
  end

  def create_person(person)
    @people << person
    write_to_file(@people,'people.json')
  
  end

  def create_book(book)
    @books << book
   write_to_file(@books,'books.json')

  end

  def create_rental(rental)
    @rentals << rental
  write_to_file(@rentals,'rentals.json')
  end

  def list_books
    @books= read_item('books.json')
    @books.each_with_index { |book, idx| puts "#{idx}) Title: #{book['title']} Author: #{book['author']}" }
  end

  def list_people
    @people=read_item('people.json')
    @people.each_with_index do |person, idx|
      puts "#{idx}) [#{person['class']}] Name:#{person['name']} ID: #{person['id']} Age: #{person['age']}"
    end
  end

  def create_student(age, name, parent_permission)
    Student.new(age, name, parent_permission: parent_permission.downcase == 'y')
  end

  def create_teacher(age, specialization, name)
    Teacher.new(age, specialization, name)
  end

  def add_rental(date, book_idx, person_number)
    Rental.new(date, @books[book_idx], @people[person_number])
  end

  def find_person_by_id(id)
    @people=read_item('people.json')
    @people.select { |person| person['id'] == id }.first
  end

  def list_rentals_by_person_id(id)
    person = find_person_by_id(id)

    if person
      puts 'Rentals:'
      @rentals=read_item('rentals.json')
      @rentals.each do |rental|
        puts "Date: #{rental['date']} Book: \" #{rental['book']['title']} \" by #{rental['book']['author']}" if rental['person']['id'] == id
      end
    else
      puts "no such person with ID #{id} exists"
    end
  end

end
