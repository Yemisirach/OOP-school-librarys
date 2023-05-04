require_relative '../class/classroom'
require_relative '../class/student'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Maths')
    @student = Student.new(26, 'esada')
  end

  describe 'Classroom' do
    it 'checks if its an instance of classroom' do
      expect(@classroom).to be_an_instance_of(Classroom)
    end
  end

  describe 'Can Add students' do
    context 'With valid input' do
      it 'checks if the classroom contains student' do
        @classroom.add_student(@student)
        expect(@classroom.students).to include(@student)
      end
    end
  end
end
