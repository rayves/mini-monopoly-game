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
end
