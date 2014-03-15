# require 'board'
# require 'player'

class Game
  attr_reader :boards, :players, :current_player, :board_dimensions

  def initialize(number_players, board_dimensions)
    @players = []
    1.upto(number_players.to_i) { |index| @players << Player.new(index,board_dimensions) }
    @boards = []
    @board_dimensions = board_dimensions
    board_counter = 1
    1.upto(board_dimensions.to_i) do
      1.upto(board_dimensions.to_i) do
        @boards << Board.new(board_counter)
        board_counter += 1
      end
    end
    who_starts
  end

  def switch_player
    temp_player = @players.shift
    @players << temp_player
    @current_player = @players.first
  end

  def whose_turn
    @current_player.name
  end

  def who_starts
    @players.shuffle!
    @current_player = @players.first
  end

  def make_move(board_number, value)
    if !@boards[board_number - 1].board_spaces.include?(value)
      @current_player.add_space(board_number, value)
      @boards[board_number - 1].board_spaces << value
      true
    else
      false
    end
  end

  def is_winner
    big_winner = false
    0.upto(@board_dimensions - 1) do |i|
      h_results = []
      (i*board_dimensions).upto(i*board_dimensions + board_dimensions) do |j|
        h_results << boards[j-1].winner_check(@current_player)
      end
      if h_results.uniq! != nil
        if h_results.length == 1 && h_results[0] != nil
          big_winner = true
        end
      end
    end
    1.upto(@board_dimensions) do |i|
      v_results = []
      0.upto(@board_dimensions - 1) do |j|
        v_results << @boards[ i + (j * @board_dimensions) - 1].winner_check(@current_player)
      end
      if v_results.uniq! != nil
        if v_results.length == 1 && v_results[0] != nil
          big_winner = true
        end
      end
    end
    # d_results = []
    # 0.upto(board_dimensions - 1) do |i|
    #   d_results << @boards[ i * (@board_dimensions + 1) + 1].winner_check(@current_player)
    # end
    # if d_results.uniq! != nil
    #   if d_results.length == 1
    #     big_winner = d_results[0]
    #   end
    # end
    # d_results = []
    # 0.upto(board_dimensions - 1) do |i|
    #   d_results << @boards[ i * (@board_dimensions - 1) + @board_dimensions].winner_check(@current_player)
    # end
    # if d_results.uniq! != nil
    #   if d_results.length == 1
    #     big_winner = d_results[0]
    #   end
    # end
    big_winner
  end

  def is_stalemate
    stalemate = true
    @boards.each do |brd|
      if brd.board_spaces.length != 9
        stalemate = false
      end
    end
    stalemate
  end

  def new_game
    @spaces = []
    @player1.clear_spaces
    @player2.clear_spaces
  end
end
