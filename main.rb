require_relative './class/app'
require_relative './class/library'
def list_options
  puts 'welcome to school library app!'
  puts
  puts 'please choose an option by entering a number:'
  puts '1 - list all books'
  puts '2 - list all people'
  puts '3 - create a person'
  puts '4 - create a book'
  puts '5 - create a rental'
  puts '6 - list all rentals for a given person id'
  puts '7 - exit'
end

def main
  library = Library.new
  app = App.new(library)
  loop do
    list_options
    value = gets.chomp
    case value
    when '1'
      app.handle_one
    when '2'
      app.handle_two
    when '3'
      app.handle_three
    when '4'
      app.handle_four
    when '5'
      app.handle_five
    when '6'
      app.handle_six
    when '7'
      app.handle_seven
      break
    else
      puts 'please select a valid option'
    end
  end
end

main
