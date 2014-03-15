require './lib/game'
require './lib/player'
require './lib/board'

@current_game

def main_menu
  system('clear')
  puts "*******************\n*TIC ** TAC ** TOE*\n*******************\n\n"
  puts "press g to begin a new game"
  puts "press x to exit"
  main_choice = gets.chomp
  case main_choice
  when 'g'
    game_start
  when 'x'
    puts "you are missing out on a fun fun time"
    exit
  else
    idiot_menu
  end
end

def game_start
  system('clear')
  puts "*******************\n*TIC ** TAC ** TOE*\n*******************\n\n"
  puts "Welcome to the best time you've had in years!"
  puts "How many players are playing?"
  num_players = gets.chomp.to_i
  puts "How wide/tall should the board of boards be?"
  board_num = gets.chomp.to_i
  @current_game = Game.new(num_players, board_num)
  1.upto(num_players) do |i|
    puts "Enter a player name."
    player_name = gets.chomp
    puts "Enter that players letter."
    player_letter = gets.chomp
    @current_game.players[i - 1].set_name(player_name)
    @current_game.players[i - 1].set_letter(player_letter)
  end
  puts "#{@current_game.whose_turn} goes first!\nPress enter to begin!"
  gets
  game_menu
end

def game_menu
  system('clear')
  display_board
  puts "#{@current_game.whose_turn} chose the number of the board you want play on"
  board_choice = gets.chomp.to_i
  while board_choice < 1 || board_choice > @current_game.board_dimensions**2
    puts "that board does not exist. Try again"
    board_choice = gets.chomp.to_i
  end
  puts "#{@current_game.whose_turn} chose the space on the board that you want to play"
  move_choice = gets.chomp.to_i
  while move_choice > 9 || move_choice < 1
    puts "That is not even on the board. Come on. Try again."
    move_choice = gets.chomp
  end

  if !@current_game.make_move(board_choice, move_choice)
    puts "You are dumb that spot is taken. Press enter to try again."
    gets
    game_menu
  elsif @current_game.is_winner
     game_won
  elsif @current_game.is_stalemate
    game_stalemate
  else
    @current_game.switch_player
    game_menu
  end
end

def game_won
  puts "CONGRATS #{@current_game.current_player.id} you won press enter return to the main menu"
  gets
  @current_game.new_game
  main_menu
end

def game_stalemate
  system('clear')
  puts "*******************\n*TIC ** TAC ** TOE*\n*******************\n\n"
  puts "Congratulations, you both lose!\nPress enter to see if you can suck less next time."
  gets
  @current_game.new_game
  main_menu
end

def display_board
  1.upto(@current_game.board_dimensions) do |n| #vertical board locations
    1.upto(@current_game.board_dimensions) do |p| #Above 1st row board number generation.
      board_id = (@current_game.board_dimensions * (n - 1)) + p
      if board_id < 10
        print "#{board_id}        "
      else
        print "#{board_id}       "
      end
    end
    print "\n"
    1.upto(@current_game.board_dimensions) do |m| #1st row loop horizontal board locations
      board_row1_array = []
      for i in 1..3
        space_value = i
        if @current_game.boards[(@current_game.board_dimensions * (n - 1)) + m - 1].board_spaces.include?(i)
          @current_game.players.each do |player|
            if player.every_space[(@current_game.board_dimensions * (n - 1)) + m - 1].include?(i)
              space_value = player.letter
            end
          end
        end
        board_row1_array << space_value
      end
      print "#{board_row1_array.join("|")}"
      if m < @current_game.board_dimensions
        print " || "
      else
        print "\n"
      end
    end
    1.upto(@current_game.board_dimensions) do |m| #2nd row loop horizontal board locations
      board_row2_array = []
      for i in 4..6
        space_value = i
        if @current_game.boards[(@current_game.board_dimensions * (n - 1)) + m - 1].board_spaces.include?(i)
          @current_game.players.each do |player|
            if player.every_space[(@current_game.board_dimensions * (n - 1)) + m - 1].include?(i)
              space_value = player.letter
            end
          end
        end
        board_row2_array << space_value
      end
      print "#{board_row2_array.join("|")}"
      if m < @current_game.board_dimensions
        print " || "
      else
        print "\n"
      end
    end
    1.upto(@current_game.board_dimensions) do |m| #3rd row loop horizontal board locations
      board_row3_array = []
      for i in 7..9
        space_value = i
        if @current_game.boards[(@current_game.board_dimensions * (n - 1)) + m - 1].board_spaces.include?(i)
          @current_game.players.each do |player|
            if player.every_space[(@current_game.board_dimensions * (n - 1)) + m - 1].include?(i)
              space_value = player.letter
            end
          end
        end
        board_row3_array << space_value
      end
      print "#{board_row3_array.join("|")}"
      if m < @current_game.board_dimensions
        print " || "
      else
        print "\n"
      end
    end
    print "\n"
  end
end

def idiot_menu
  system('clear')
  puts "All right, dummy, you clearly can't handle a simple menu. For that you will be punished.\n"
  puts "press a if you want your punishment in kicks"
  puts "press b if you would prefer chinese water torture"
  puts "press c if you are physically too fragile and would prefer emotional punishment"
  punishment_choice = gets.chomp
  case punishment_choice
  when 'a'
    puts "*kick*   *kapow*   *zok!*    *biff!*"
  when 'b'
    puts "That's a really asinine choice. We're going to kick you anyway."
    puts "*kick*   *kapow*   *zok!*    *biff!*"
  when 'c'
    puts "you have no friends and your parents have never respected you. Plus I slept with your partner last night"
  else
    idiot_menu
  end
  puts "Press enter to try again. Do yourself a favor and be smarter this time."
  gets
  main_menu
end



main_menu
