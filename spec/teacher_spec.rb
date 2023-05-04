require_relative '../class/teacher'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new(27, 'math', 'yemi')
  end

  describe 'Teacher' do
    it 'checks if its an instance of Teacher' do
      expect(@teacher).to be_an_instance_of(Teacher)
    end
  end

  describe 'can_use_services' do
    context 'With valid input' do
      it 'checks if the teacher can_use_services' do
        @teacher.can_use_services?
        expect(@teacher.can_use_services?).to be true
      end
    end
  end
end
