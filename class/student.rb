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

  def to_h
    { class: self.class.name,
      object_id: object_id,
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      rentals: @rentals,
      classroom: @classroom }
  end
end
