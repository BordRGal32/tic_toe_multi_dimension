require './lib/game'
require './lib/player'

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
  puts "Enter player 1's name:"
  player_1 = gets.chomp
  puts "Enter player 2's name:"
  player_2 = gets.chomp
  @current_game = Game.new({ :player1 => player_1, :player2 => player_2})
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
  array1 = []
  for i in 1..3
    if @current_game.spaces.include?(i)
      if @current_game.player1.spaces.include?(i)
        array1 << "X"
      else
        array1 << "O"
      end
    else
      array1 << i
    end
  end
  array2 = []
  for i in 4..6
    if @current_game.spaces.include?(i)
      if @current_game.player1.spaces.include?(i)
        array2 << "X"
      else
        array2 << "O"
      end
    else
      array2 << i
    end
  end
  array3 = []
  for i in 7..9
    if @current_game.spaces.include?(i)
      if @current_game.player1.spaces.include?(i)
        array3 << "X"
      else
        array3 << "O"
      end
    else
      array3 << i
    end
  end
  puts "-------\n[#{array1.join("|")}]\n-------\n[#{array2.join("|")}]\n-------\n[#{array3.join("|")}]\n-------"
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
