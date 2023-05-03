require_relative "../class/book.rb"
require_relative "../class/rental.rb"

describe Book do
  before(:each) do
    @book = Book.new("the power of now", "Jey")
  end

  describe 'book' do
    it 'checks if its an instance of book' do
      expect(@book).to be_an_instance_of(Book)
    end
  end

#    describe 'add_rental' do
#     context 'With valid input' do
#       it 'checks if the book have rental' do
#         @teacher.can_use_services?
#         expect(@teacher.can_use_services?).to be true
#       end
#     end
  end
 
end