require 'rspec'
require 'player'

describe Player do
  describe '#initialize' do
    it 'creates an instance of Player' do
      new_player = Player.new('georgetta', 2)
      new_player.should be_an_instance_of Player
    end
  end
  describe '#add_space' do
    it 'adds the selected space to the players every_space in the array of the specified board' do
      new_player = Player.new('Henry', 3)
      new_player.add_space(2, 1)
      new_player.every_space[1].length.should eq 1
    end
  end
  describe '#set_name' do
    it 'sets the player name' do
      new_player = Player.new(1, 2)
      new_player.set_name('Oswaldo')
      new_player.name.should eq 'Oswaldo'
    end
  end
  describe '#set_letter' do
    it 'sets the player letter' do
      new_player = Player.new(23, 1)
      new_player.set_letter('Y')
      new_player.letter.should eq 'Y'
    end
  end
end
