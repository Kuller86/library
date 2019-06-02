class Library
  attr_reader :authors, :books, :readers, :orders

  def initialize(authors: [], books: [], readers: [], orders: [])
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  def top_books(quantity = 1)
    @orders.map(&:book)
           .group_by(&:title)
           .sort_by { |_group, books| -books.size }
           .first(quantity)
           .map(&:first)
  end

  def top_readers(quantity = 1)
    @orders.map(&:reader)
           .group_by(&:name)
           .sort_by { |_group, readers| -readers.size }
           .first(quantity)
           .map(&:first)
  end

  def number_of_readers_top_books(quantity = 3)
    top_books = top_books(quantity)
    @orders.select { |order| top_books.include?(order.book.title) }.uniq(&:reader).size
  end
end
