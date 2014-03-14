require 'rspec'
require 'board'

describe Board do
    it 'initializes an instance of Board' do
    new_board = Board.new(1)
    new_board.should be_an_instance_of Board
  end
    it 'should initialize with an empty array for all of the board spaces'do
    new_board = Board.new(3)
    new_board.board_spaces.should eq []
  end
end
