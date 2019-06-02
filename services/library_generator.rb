class LibraryGenerator
  class << self
    private

    def generate_authors(quantity = 10)
      quantity.times.collect { Author.new(FFaker::Name.name, 'Must be biography') }
    end

    def generate_books(authors, quantity = 50)
      quantity.times.collect { Book.new(FFaker::Book.title, authors.sample) }
    end

    def generate_readers(quantity = 50)
      quantity.times.collect do
        name = FFaker::Name.name
        email = FFaker::Internet.email
        city = FFaker::Address.city
        street = FFaker::Address.street_name
        house = rand(1..50)

        Reader.new(name, email, city, street, house)
      end
    end

    def generate_orders(books, readers, quantity = 100)
      quantity.times.map do
        book = books.sample
        reader = readers.sample

        Order.new(book, reader)
      end
    end

    public

    def generate
      authors = generate_authors
      books = generate_books(authors)
      readers = generate_readers
      orders = generate_orders(books, readers)

      library = Library.new(
        authors: authors,
        books: books,
        readers: readers,
        orders: orders
      )

      DataManager.save_data(library)

      library
    end

    def load_from_file(filename = DataManager::STORE_FILE)
      if File.exist?(filename)
        DataManager.load_data(filename)
      else
        generate
      end
    end
  end
end
