class Board
  attr_reader :board_spaces, :board_number, :winner

  def initialize(board_number)
    @board_number = board_number
    @board_spaces = []
    @winner = false
  end

  def winner_check(current_player)
    if [1,2,3] - current_player.every_space[@board_number-1] == [] ||
      [4,5,6] - current_player.every_space[@board_number-1] == []||
      [7,8,9] - current_player.every_space[@board_number-1] == []||
      [1,4,7] - current_player.every_space[@board_number-1] == []||
      [2,5,8] - current_player.every_space[@board_number-1] == []||
      [3,6,9] - current_player.every_space[@board_number-1] == []||
      [1,5,9] - current_player.every_space[@board_number-1] == []||
      [3,5,7] - current_player.every_space[@board_number-1] == []
      @winner = current_player
      @winner.name
    end
  end


end
