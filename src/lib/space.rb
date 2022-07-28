class Space
  attr_reader :name, :price, :colour, :type
  attr_accessor :owner

  def initialize(name, price, colour, type, owner)
    @name = name
    @price = price
    @colour = colour
    @type = type
    @owner = owner
  end
end