require_relative '../lib/space'
require_relative '../lib/player'

describe 'Player' do
  before(:each) do
    @player = Player.new('Ray')
    @spaces = []
    @spaces << Space.new('GO', nil, nil, 'go', 'Cannot be purchased')
    @spaces << Space.new('The Burvale', 1, 'Brown', 'property', 'unowned')
    @spaces << Space.new('Fast Kebabs', 1, 'Brown', 'property', 'unowned')
    @spaces << Space.new('The Grand Tofu', 2, 'Red', 'property', 'unowned')
    @spaces << Space.new('Lanzhou Beef Noodle', 2, 'Red', 'property', 'unowned')
    @spaces << Space.new("Betty's Burgers", 3, 'Green', 'property', 'unowned')
    @spaces << Space.new('YOMG', 3, 'Green', 'property', 'unowned')

    @property = @spaces[1]
  end

  it 'should be an instance of Player' do
    expect(@player).to be_a Player
  end

  it 'should have a name attribute' do
    expect(@player.name).to eq('Ray')
  end

  it 'should start with $16 in its wallet' do
    expect(@player.wallet).to eq(16)
  end

  it 'should hold not properties when created' do
    expect(@player.properties.count).to eq(0)
  end

  it 'should start at 0 for its current position' do
    expect(@player.current_position).to eq(0)
  end

  describe '.new_position' do
    it 'should return an integer' do
      roll = 5
      expect(@player.new_position(roll, @spaces)).to be_an_instance_of(Integer)
    end

    it 'should return an integer that is greater than the players current position but less than the total number of spaces in 1 loop' do
      roll_one = 3
      expect(@player.new_position(roll_one, @spaces)).to be(3)
      @player.current_position = @player.new_position(roll_one, @spaces)

      roll_two = 2
      expect(@player.new_position(roll_two, @spaces)).to be(5)
      @player.current_position = @player.new_position(roll_two, @spaces)
    end

    it 'should return an integer that is less than the players current position if the roll sumed with the current position is greater than the total number of spaces' do
      @player.current_position = 5
      roll = 6
      expect(@player.new_position(roll, @spaces)).to be(4)
    end
  end

  describe '.buy_property' do
    it 'should return nil if the player cannot afford the property' do
      @player.wallet = 0
      expect(@player.buy_property(@property)).to be(nil)
    end

    it 'should add the property to the players properties list' do
      pre_purchase_properties = @player.properties.count
      @player.buy_property(@property)
      expect(@player.properties[-1]).to eq(@property)
      expect(@player.properties.count).to be(pre_purchase_properties + 1)
    end

    it "should update the property's owner attribute to be the player" do
      @player.buy_property(@property)
      expect(@property.owner).to eq(@player)
    end

    it "should decrease the player's wallet by the cost of the property" do
      pre_buy_wallet = @player.wallet
      @player.buy_property(@property)
      expect(@player.wallet).to be(pre_buy_wallet - @property.price)
    end
  end

  describe '.check_set' do
    it 'should return 1 if player does not have a colour set of properties' do
      expect(@player.check_set(@property.colour)).to be(1)
    end

    it 'should return 2 if player does have a colour set of properties' do
      @player.properties << @spaces[1]
      @player.properties << @spaces[2]
      expect(@player.check_set(@property.colour)).to be(2)
    end

    it 'should return 2 if player has 2 colour sets of properties' do
      @player.properties << @spaces[1]
      @player.properties << @spaces[2]
      @player.properties << @spaces[3]
      @player.properties << @spaces[4]
      expect(@player.check_set(@property.colour)).to be(2)
    end
  end

  describe '.bankruptcy_check' do
    it "should return 'bankrupt' if the player's wallet is less than rent" do
      @player.wallet = 3
      expect(@player.bankruptcy_check(5)).to eq('bankrupt')
    end

    it "should return false if player's wallet is greater than rent" do
      expect(@player.bankruptcy_check(5)).to eq(false)
    end
  end
end
