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
  puts "#{@current_game.whose_turn}, choose the number of the square you want."

  display_board
  move_choice = gets.chomp.to_i
  while move_choice > 9 || move_choice < 1
    puts "That is not even on the board. Come on. Try again."
    move_choice = gets.chomp
  end

  if !@current_game.make_move(move_choice)
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
  k = 0
  1.upto(@current_game.board_dimensions) do |n|
    1.upto(@current_game.board_dimensions) do |m|
      for j in 1..@current_game.board_dimensions
        array1 = []
        for i in 1..3
          if @current_game.boards[j].board_spaces.include?(i)
          #   if @current_game.players.spaces.include?(i)
          #     array1 << "X"
          #   else
          #     array1 << "O"
          #   end
          # else
            array1 << i
          end
        end
        print "#{array1.join("|")} | "
      end


      array2 = []
      for i in 4..6
        if @current_game.boards[j].board_spaces.include?(i)
        #   if @current_game.player1.spaces.include?(i)
        #     array2 << "X"
        #   else
        #     array2 << "O"
        #   end
        # else
          array2 << i
        end
      end
      array3 = []
      for i in 7..9
        if @current_game.boards[j].board_spaces.include?(i)
        #   if @current_game.player1.spaces.include?(i)
        #     array3 << "X"
        #   else
        #     array3 << "O"
        #   end
        # else
          array3 << i
        end
      end
      print "-------\n[#{array1.join("|")}]\n-------\n[#{array2.join("|")}]\n-------\n[#{array3.join("|")}]\n-------"
    end
    k += 1
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
