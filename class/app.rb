class App
  def initialize(library)
    @library = library
  end

  def handle_one()
    @library.list_books
  end

  def handle_two()
    @library.list_people
  end

  def handle_three()
    print 'do you want to create a student (1) or a teacher (2)? [input a number]: '
    value = gets.chomp
    print 'age: '
    age = gets.chomp
    if value == '2'
      print 'specialization: '
      specialization = gets.chomp
      print 'name: '
      name = gets.chomp
      person = @library.create_teacher(age, specialization, name)
    else
      print 'name: '
      name = gets.chomp
      print 'Has parents\' permission [Y/N]? : '
      permission = gets.chomp
      person = @library.create_student(age, name, permission)
    end
    @library.create_person(person)
    puts 'person created successfully'
  end

  def handle_four()
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @library.create_book(book)
    puts 'Book created successfully'
  end

  def handle_five()
    if @library.books.empty? || @library.people.empty?
      puts 'There are no books or people to create a rental'
    else
      puts 'select a book form the following list by  number'
      @library.list_books
      book_idx = gets.chomp.to_i
      puts 'select a person form the following list by  number (not id)'
      @library.list_people
      person_number = gets.chomp.to_i
      print 'date: '
      date = gets.chomp
      rental = @library.add_rental(date, book_idx, person_number)
      @library.create_rental(rental)
      puts 'Rental created successfully'
    end
  end

  def handle_six()
    print 'ID of the person: '
    id = gets.chomp.to_i
    @library.list_rentals_by_person_id(id)
  end

  def handle_seven
    puts 'Thank you for using this app'
    exit
  end

  def init_library
    if File.exist?('books.json') || File.exist?('people.json') || File.exist?('rentals.json') 
      puts 'loading data'
    else
      puts 'no data proceeding'
    end
  end
end
