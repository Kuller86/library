class Output
  class << self
    def show(library)
      top_books(library)
      top_readers(library)
      number_of_readers_top_books(library)
    end

    private

    def top_books(library)
      output('Top books', library.top_books)
    end

    def top_readers(library)
      output('Top readers', library.top_readers)
    end

    def number_of_readers_top_books(library)
      output('Number of readers top books', library.number_of_readers_top_books)
    end

    def output(title, data)
      full_title = '*' * 10 + ' ' + title + ' ' + '*' * 10
      puts full_title
      puts data
      puts '*' * full_title.length
    end
  end
end
