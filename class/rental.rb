class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
    book.rentals << self
    person.rentals << self
  end

  def to_h
    {
      class: self.class.name,
      object_id: object_id,
      date: @date,
      book: @book,
      person: @person
    }
  end
end
