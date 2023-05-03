require_relative "../class/teacher.rb"
require_relative "../class/book.rb"
require_relative "../class/rental.rb"

describe Rental do
  before(:each) do
      teacher = Teacher.new(27,"math" "yemi")
      book = Book.new("the power of now", "Jey")
    @rental = Rental.new('01-03-2023',book,teacher)
  end

  describe 'Rental' do
    it 'checks if its an instance of Rental' do
      expect(@rental).to be_an_instance_of(Rental)
    end
  end

 
 
end