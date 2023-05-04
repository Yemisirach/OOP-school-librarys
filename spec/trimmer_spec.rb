require_relative "../class/person.rb"
require_relative "../class/trimmer.rb"

describe Person do
 
  before(:each) do
    @person_one = Person.new(27, "abcdefghijkl")
    @person_trim=TrimmerDecorator.new(@person_one)
  end


  describe 'instance' do
    it 'checks if its an instance of person' do
      expect(@person_one).to be_an_instance_of(Person)
    end
    it 'checks if its an instance of trimmer' do
      expect(@person_trim).to be_an_instance_of(TrimmerDecorator)
    end
  end

   describe 'can_use trimmer Decorator' do
    context 'Trimmer decoretor' do
      it 'checks if the correct_name Decorotir method trims name longer than 10 chars' do
        expect(@person_trim.correct_name).to eq ('abcdefghij')
      end
    end
  end
 
end
