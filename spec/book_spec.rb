require_relative '../class/book'
require_relative '../class/rental'
require_relative '../class/student'

describe Book do
  before(:each) do
    @book = Book.new('the power of now', 'Jey')
  end

  describe 'book' do
    it 'checks if its an instance of book' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'checks if the book have rental' do
      person_double = Student.new(12, 'some')
      date = '20/4/2023'
      rental = Rental.new(date, @book, person_double)
      @book.add_rental(rental)
      expect(@book.rentals).to include(rental)
    end
  end
end
