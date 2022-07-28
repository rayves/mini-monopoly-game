require_relative '../lib/helper_methods'
require_relative '../lib/player'

describe 'connect_rolls_to_players' do
  before(:each) do
    player_names = %w[Peter Billy Charlotte]
    @rolls = [4, 6, 1, 2, 4, 1]
    @players = generate_players(player_names)
    @player_rolls = connect_rolls_to_players(@players, @rolls)
  end

  it 'should return an array of hashes' do
    expect(@player_rolls).to be_a Array
    @player_rolls.each do |roll|
      expect(roll).to be_a Hash
    end
  end

  it 'should return an array of hashes where the key is a player and the value is their roll' do
    expect(@player_rolls[0].keys[0]).to eq(@players[0])
    expect(@player_rolls[1].keys[0]).to eq(@players[1])
    expect(@player_rolls[2].keys[0]).to eq(@players[2])
    expect(@player_rolls[3].keys[0]).to eq(@players[0])
    expect(@player_rolls[4].keys[0]).to eq(@players[1])
    expect(@player_rolls[5].keys[0]).to eq(@players[2])
    expect(@player_rolls[0].values[0]).to eq(@rolls[0])
    expect(@player_rolls[1].values[0]).to eq(@rolls[1])
    expect(@player_rolls[2].values[0]).to eq(@rolls[2])
    expect(@player_rolls[3].values[0]).to eq(@rolls[3])
    expect(@player_rolls[4].values[0]).to eq(@rolls[4])
    expect(@player_rolls[5].values[0]).to eq(@rolls[5])
  end
end

describe 'check_winner' do
  before(:each) do
    @player_names = %w[Peter Billy Charlotte Sweedal].freeze
    @players = generate_players(@player_names)
    @peter = @players[0]
    @billy = @players[1]
    @charlotte = @players[2]
    @sweedal = @players[3]
    @peter.wallet = 24
    @billy.wallet = 10
    @charlotte.wallet = 14
    @sweedal.wallet = 0
  end

  it 'should return the player with the most money' do
    expect(check_winner(@players)).to eq(@peter)
    @billy.wallet = 50
    expect(check_winner(@players)).to eq(@billy)
  end
end
