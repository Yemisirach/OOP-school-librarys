require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './rental'
class App
  def list_options
    puts 'welcome  to school library app!'
    puts
    puts 'please choose an opption by entering a number:'
    puts '1 -  list all books'
    puts '2 -  list all people'
    puts '3 -  create a person'
    puts '4 -  cretae a book'
    puts '5 -  craete a rental'
    puts '6 -  list all rentals for a given person id'
    puts '7 -  exit'
  end

  def handle_one(books)
    books.each_with_index { |book, idx| puts "#{idx}) Title: #{book.title} Author: #{book.author}" }
  end

  def handle_two(people)
    people.each_with_index do |person, idx|
      puts "#{idx}) [#{person.class}] Name:#{person.name} ID: #{person.id} Age: #{person.age}"
    end
  end

  def handle_three(people)
    print 'do you want to create a student (1) or a teacher (2)? [input a number]: '
    value = gets.chomp
    print 'age: '
    age = gets.chomp
    if value == '2'
      print 'specialization: '
      specialization = gets.chomp
      print 'name: '
      name = gets.chomp
      new_teacher = Teacher.new(age, specialization, name)
      people << new_teacher
    else
      print 'name: '
      name = gets.chomp
      print 'Has parents\' permission [Y/N]? : '
      permission = gets.chomp
      new_student = Student.new(age, name, parent_permission: permission.downcase == 'y')
      people << new_student
    end
    puts 'person created succesfully'
  end

  def handle_four(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    books << new_book
    puts 'Book created succesfully'
  end

  def handle_five(books, people, rentals)
    if books.empty? || people.empty?
      puts 'There are no books or people to create a rental'
    else
      puts 'select a book form the following list by  number'
      handle_one(books)
      book_idx = gets.chomp.to_i
      puts 'select a person form the following list by  number (not id)'
      handle_two(people)
      person_number = gets.chomp.to_i
      print 'date: '
      date = gets.chomp
      puts books[book_idx]
      new_rental = Rental.new(date, books[book_idx], people[person_number])
      rentals << new_rental
      puts 'Rental created successfully'
    end
  end

  def find_by_id(id, people)
    people.select { |person| person.id == id }
  end

  def handle_six(people, rentals)
    print 'ID of the person: '
    id = gets.chomp.to_i
    person_one = find_by_id(id, people)

    if person_one
      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental.date} Book: \" #{rental.book.title} \" by #{rental.book.author}" if rental.person.id == id
      end
    else
      puts "no such person with ID #{id} exists"
    end
  end

  def handle_seven
    puts 'Thank you for using this app'
    exit
  end

  def run
    people = []
    rentals = []
    books = []
    loop do
      list_options
      value = gets.chomp
      case value
      when '1'
        handle_one(books)
      when '2'
        handle_two(people)
      when '3'
        handle_three(people)
      when '4'
        handle_four(books)
      when '5'
        handle_five(books, people, rentals)
      when '6'
        handle_six(people, rentals)
      when '7'
        handle_seven
        break
      else
        puts 'please select a valid option'
      end
    end
  end
end
