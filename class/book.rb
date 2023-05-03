require_relative './rental'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
   @rentals<< rental

  end

  def to_h
    {
      class: self.class.name,
      object_id: object_id,
      title: @title,
      author: @author,
      rentals: @rentals
    }
  end
end
