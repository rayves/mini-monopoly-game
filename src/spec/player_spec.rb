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
end
