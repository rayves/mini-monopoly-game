require_relative '../lib/player'

describe 'Player' do
  before(:each) do
    @player = Player.new('Ray')
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
end
