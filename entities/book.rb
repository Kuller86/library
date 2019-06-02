class Book
  include Validators

  attr_reader :title, :author

  def initialize(title, author)
    validate(title, author)
    @title = title
    @author = author
  end

  def validate(title, author)
    instance?(String, title)
    not_empty?(title)
    instance?(Author, author)
  end
end
