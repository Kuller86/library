class Author
  include Validators

  attr_reader :name, :biography

  def initialize(name, biography = '')
    validate(name, biography)
    @name = name
    @biography = biography
  end

  def validate(name, biography)
    instance?(String, name, biography)
    not_empty?(name)
  end
end
