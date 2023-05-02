require_relative './person'

class Student < Person
  attr_accessor :age, :parent_permission, :name

  def initialize(age, name = 'Uknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission,)

    @classroom = nil
  end

  def classroom=(classroom)
    @classroom = classroom

    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def to_json(*args)
    { age: @age, name: @name, parent_permission: @parent_permission  }.to_json(*args)
  end
end
