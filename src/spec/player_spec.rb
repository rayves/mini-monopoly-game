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
end
