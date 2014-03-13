require 'rspec'
require 'player'

describe Player do
  describe '#initialize' do
    it 'creates an instance of Player' do
      new_player = Player.new('georgetta')
      new_player.should be_an_instance_of Player
    end
  end
  describe '#add_space' do
    it 'adds the selected space to the players space_array' do
      new_player = Player.new('Henry')
      new_player.add_space(2)
      new_player.spaces.length.should eq 1
    end
  end
end
