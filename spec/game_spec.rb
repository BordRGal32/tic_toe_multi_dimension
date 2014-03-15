require 'rspec'
require 'game'
require 'player'

describe Game do
  describe '#initialize' do
    it 'creates an instance of Game' do
      test_game = Game.new(2, 1)
      test_game.should be_an_instance_of Game
    end
  end

  # describe '#switch_player' do
  #   it 'changes the current_player and the other_player' do
  #     test_game  = Game.new(2, 1)
  #     current_turn = test_game.whose_turn
  #     test_game.switch_player
  #     test_game.whose_turn.should_not eq current_turn
  #   end
  # end

  # describe '#whose_turn' do
  #   it 'returns the id of the player whose turn it is' do
  #     Array.any_instance.stub(:shuffle!)
  #     test_game  = Game.new(2,1)
  #     test_game.whose_turn.should eq 1
  #   end
  # end
  describe '#make_move' do
    it 'creates a space for current_player' do
      Array.any_instance.stub(:shuffle!)
      test_game = Game.new(2,1)
      test_game.make_move(1, 2)
      test_game.players[0].every_space[0].length.should eq 1
    end
    it 'returns false if the move has already been made' do
      Game.any_instance.stub(:rand).and_return(0)
      test_game = Game.new(2,1)
      test_game.make_move(1, 2)
      test_game.switch_player
      test_game.make_move(1, 2).should eq false
    end
  end
  describe '#is_winner' do
    it 'returns true when a game has been won' do
      test_game = Game.new(2,2)
      test_game.players[0].set_name("Ben")
      test_game.players[1].set_name("Lauren")
      1.upto(2) do |j|
        1.upto(9) do |i|
          test_game.make_move(j,i)
        end
      end
      test_game.is_winner.should_not eq ""
    end
    it 'returns true when a game has been won' do
      test_game = Game.new(2,2)
      test_game.players[0].set_name("Ben")
      test_game.players[1].set_name("Lauren")
      1.upto(2) do |j|
        1.upto(9) do |i|
          test_game.make_move(j * 2,i)
        end
      end
      test_game.is_winner.should_not eq ""
    end
    # it 'returns true when a game has been won' do
    #   test_game = Game.new(2,2)
    #   test_game.players[0].set_name("Ben")
    #   test_game.players[1].set_name("Lauren")
    #   1.upto(9) do |i|
    #     test_game.make_move(1,i)
    #   end
    #   1.upto(9) do |i|
    #     test_game.make_move(4,i)
    #   end
    #   test_game.is_winner.should eq true
    # end
    # it 'returns true when a game has been won' do
    #   test_game = Game.new(2,2)
    #   test_game.players[0].set_name("Ben")
    #   test_game.players[1].set_name("Lauren")
    #   1.upto(9) do |i|
    #     test_game.make_move(2,i)
    #   end
    #   1.upto(9) do |i|
    #     test_game.make_move(3,i)
    #   end
    #   test_game.is_winner.should eq true
    # end
     it 'returns false when a game has not been won' do
      test_game = Game.new(2,2)
      test_game.players[0].set_name("Ben")
      test_game.players[1].set_name("Lauren")
      1.upto(9) do |i|
        test_game.make_move(2,i)
      end
      test_game.is_winner.should eq false
    end
  end

  describe '#is_stalemate' do
    it 'returns true if all boards are full have been made' do
      test_game = Game.new(2,2)
      test_game.players[0].set_name("Ben")
      test_game.players[1].set_name("Lauren")
      1.upto(4) do |j|
        1.upto(9) do |i|
          test_game.make_move(j,i)
        end
      end
      test_game.is_stalemate.should eq true
    end
  end
end
