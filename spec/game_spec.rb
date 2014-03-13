require 'rspec'
require 'game'
require 'player'

describe Game do
  describe '#initialize' do
    it 'creates an instance of Game' do
      test_game = Game.new({ :player1 => 'Lauren', :player2 => 'Ben' })
      test_game.should be_an_instance_of Game
    end
  end

  describe '#switch_player' do
    it 'changes the current_player and the other_player' do
      test_game  = Game.new({ :player1 => 'Lauren', :player2 => 'Ben' })
      current_turn = test_game.whose_turn
      test_game.switch_player
      test_game.whose_turn.should_not eq current_turn
    end
  end

  describe '#whose_turn' do
    it 'returns the id of the player whose turn it is' do
      Game.any_instance.stub(:rand).and_return(0)
      test_game  = Game.new({ :player1 => 'Lauren', :player2 => 'Ben' })
      test_game.whose_turn.should eq 'Lauren'
    end
  end

  describe '#make_move' do
    it 'creates a space for current_player' do
      Game.any_instance.stub(:rand).and_return(0)
      test_game = Game.new({ :player1 => 'Ben', :player2 => 'Lauren' })
      test_game.make_move(2)
      test_game.player1.spaces.length.should eq 1
    end
    it 'returns "not a valid move" if the move has already been made' do
      Game.any_instance.stub(:rand).and_return(0)
      test_game = Game.new({ :player1 => 'Ben', :player2 => 'Lauren' })
      test_game.make_move(2)
      test_game.switch_player
      test_game.make_move(2).should eq "not a valid move"
    end
  end
  describe '#is_winner' do
    it 'returns true when a game has been won' do
      test_game = Game.new({ :player1 => 'Ben', :player2 => 'Lauren' })
      test_game.make_move(1)
      test_game.make_move(2)
      test_game.make_move(3)
      test_game.is_winner.should eq true
    end
    it 'returns true when a game has been won' do
      test_game = Game.new({ :player1 => 'Ben', :player2 => 'Lauren' })
      test_game.make_move(7)
      test_game.make_move(8)
      test_game.make_move(9)
      test_game.is_winner.should eq true
    end
    it 'returns true when a game has been won' do
      test_game = Game.new({ :player1 => 'Ben', :player2 => 'Lauren' })
      test_game.make_move(1)
      test_game.make_move(5)
      test_game.make_move(9)
      test_game.is_winner.should eq true
    end
    it 'returns true when a game has been won' do
      test_game = Game.new({ :player1 => 'Ben', :player2 => 'Lauren' })
      test_game.make_move(3)
      test_game.make_move(6)
      test_game.make_move(9)
      test_game.is_winner.should eq true
    end
    it 'returns false when a game has not been won' do
      test_game = Game.new({ :player1 => 'Ben', :player2 => 'Lauren' })
      test_game.make_move(1)
      test_game.make_move(2)
      test_game.is_winner.should eq false
    end
  end

  describe '#is_stalemate' do
    it 'returns true if 9 moves have been made' do
      test_game = Game.new({ :player1 => 'Ben', :player2 => 'Lauren' })
      test_game.make_move(1)
      test_game.make_move(2)
      test_game.make_move(3)
      test_game.make_move(4)
      test_game.make_move(5)
      test_game.make_move(6)
      test_game.make_move(7)
      test_game.make_move(8)
      test_game.make_move(9)
      test_game.is_stalemate.should eq true
    end
  end
end
