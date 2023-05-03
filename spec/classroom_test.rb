require_relative "../class/classroom.rb"
require_relative "../class/student.rb"


describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Maths')
    @student = Student.new(26,  'Ermiyas')
  end

  describe '#new' do
    it 'returns a classroom object' do
      expect(@classroom).to be_an_instance_of(Classroom)
    end
  end

   describe '#add_students' do
    context 'when the student' do
      it 'checks if the student has a classroom' do
        @classroom.add_student(@student)
        expect(@classroom.students).to include(@student)
      end
    end
  end
 
end