require_relative '../lib/space'

describe 'Space' do
  before(:each) do
    @space = Space.new('The Burvale', 1, 'Brown', 'property', 'unowned')
  end

  it 'should be an instance of Space' do
    expect(@space).to be_a Space
  end

  it 'should have a name attribute' do
    expect(@space.name).to eq('The Burvale')
  end

  it 'should have a price' do
    expect(@space.price).to eq(1)
  end

  it 'should have a colour' do
    expect(@space.colour).to eq('Brown')
  end

  it 'should have a type' do
    expect(@space.type).to eq('property')
  end

  it 'should have an ownership classification' do
    expect(@space.owner).to eq('unowned')
  end
end
