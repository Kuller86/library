class Reader
  include Validators

  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    validate(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def validate(name, email, city, street, house)
    instance?(String, name, email, city, street)
    instance?(Integer, house)
    not_empty?(name, email, city, street)
    positive?(house)
  end
end
