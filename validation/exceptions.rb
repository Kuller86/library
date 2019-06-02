module Exceptions
  class EmptyValueException < StandardError
    def initialize
      super('Argument can\'t be empty')
    end
  end

  class WrongInstanceException < StandardError
    def initialize
      super('Wrong instance!')
    end
  end

  class WrongNumberException < StandardError
    def initialize
      super('Number must be a positive!')
    end
  end
end
