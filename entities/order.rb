class Order
  include Validators

  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    validate(book, reader, date)
    @book = book
    @reader = reader
    @date = date
  end

  def validate(book, reader, date)
    instance?(Book, book)
    instance?(Reader, reader)
    instance?(Date, date)
  end
end
