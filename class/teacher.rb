require_relative './person'
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Uknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)

    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    { age: @age ,name: @name, specialization:@specialization  }.to_json(*args)
  end
end
