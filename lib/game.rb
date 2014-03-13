class Game
  attr_reader :player1, :player2, :current_player, :spaces

  def initialize(attributes)
    @player1 = Player.new(attributes[:player1])
    @player2 = Player.new(attributes[:player2])
    @spaces = []
    who_starts
  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def whose_turn
    @current_player.id
  end

  def who_starts
    if rand(2) == 0
      @current_player = @player1
    else
      @current_player = @player2
    end
  end

  def make_move(value)
    if !@spaces.include?(value)
      @current_player.add_space(value)
      @spaces << value
      true
    else
      false
    end
  end

  def is_winner
    [1,2,3] - current_player.spaces == [] ||
    [4,5,6] - current_player.spaces == [] ||
    [7,8,9] - current_player.spaces == [] ||
    [1,4,7] - current_player.spaces == [] ||
    [2,5,8] - current_player.spaces == [] ||
    [3,6,9] - current_player.spaces == [] ||
    [1,5,9] - current_player.spaces == [] ||
    [3,5,7] - current_player.spaces == []
  end

  def is_stalemate
    @spaces.length == 9
  end

  def new_game
    @spaces = []
    @player1.clear_spaces
    @player2.clear_spaces
  end
end
