module DataManager
  STORE_FILE = './storage/library.yaml'.freeze

  def self.load_data(filename)
    YAML.safe_load(
      File.read(filename),
      [Library, Author, Book, Reader, Order, Date, Symbol],
      [],
      true
    )
  end

  def self.save_data(data, filename = STORE_FILE)
    File.write(filename, YAML.dump(data))
  end
end
