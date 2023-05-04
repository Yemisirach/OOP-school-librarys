require_relative "../class/person.rb"


describe Person do
  before(:each) do
    @person = Person.new(27,"math" )
  end

  describe 'Person' do
    it 'checks if its an instance of Person' do
      expect(@person).to be_an_instance_of(Person)
    end
    it 'checks if the Person can_use_services' do
        
        expect(@person.can_use_services?).to be true
    end
   
  end

   
 
end
