

require_relative "../class/student.rb"
describe Student do
  before(:each) do
    @student = Student.new(27,"yemi")
  end

  describe 'Student' do
    it 'checks if its an instance of Student' do
      expect(@student).to be_an_instance_of(Student)
    end
    it 'checks if the Student plays hookey' do
        expect(@student.play_hooky).to eq ('¯(ツ)/¯')
      end
  end
      
 end