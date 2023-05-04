require_relative '../class/person'
require_relative '../class/capitalize'

describe Person do
  before(:each) do
    @person_one = Person.new(27, 'abcdefghijkl')
    @person_capitalize = CapitalizeDecorator.new(@person_one)
  end

  describe 'instance' do
    it 'checks if its an instance of person' do
      expect(@person_one).to be_an_instance_of(Person)
    end
    it 'checks if its an instance of captaize' do
      expect(@person_capitalize).to be_an_instance_of(CapitalizeDecorator)
    end
  end

  describe 'can_use Capitalize Decorator' do
    context 'Capitalize decoretor' do
      it 'checks if the correct_name Decorotir method capitalizes name ' do
        expect(@person_capitalize.correct_name).to eq('Abcdefghijkl')
      end
    end
  end
end
