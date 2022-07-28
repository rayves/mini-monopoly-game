class Player
  attr_reader :name, :order
  attr_accessor :wallet, :properties, :current_position, :status

  def initialize(name)
    @name = name
    @wallet = 16
    @properties = []
    @current_position = 0
    @status = 'playing'
  end

  def new_position(roll, spaces)
    total_spaces = spaces.count
    final_space = total_spaces - 1
    return @current_position + roll - total_spaces if @current_position + roll > final_space

    @current_position + roll
  end
end
