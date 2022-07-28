require_relative '../lib/helper_methods'
require_relative '../lib/player'

describe 'connect_rolls_to_players' do
  before(:each) do
    player_names = %w[Peter Billy Charlotte]
    rolls = [4, 6, 1, 2, 4, 1]
    @players = generate_players(player_names)
    @player_rolls = connect_rolls_to_players(@players, rolls)
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
  end
end
