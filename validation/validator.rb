module Validators
  include Exceptions

  def not_empty?(*args)
    raise EmptyValueException if args.any?(&:empty?)
  end

  def instance?(instance, *args)
    args.each { |object| raise WrongInstanceException unless object.is_a?(instance) }
  end

  def positive?(num)
    raise WrongNumberException unless num.positive?
  end
end
