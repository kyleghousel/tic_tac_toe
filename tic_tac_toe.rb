# 1.Board has 9 empty spaces
# 2.Two token types
# 3.Two players
# 4.One turn at a time, one token placed in one square
# 5.Player 1 turn even number turn count, Player 2 turn odd number turn count
# 6.Winning combos top row, mid row, bottom row, left col, mid col, right col, top left to bottom right diag, bottom left to top right diag
# 7.Tie if board filled with non-whitespace chars and no winning combo
# 8.New game option


#Module to house variables of game that apply to all classes and instances
#module TicTacToe
  #WINNING_COMBOS = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]

  #Generation of game tally, and "board"

#end

puts "    
    XOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXO
    XOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXO    
    XOXOXOXO        XOX      OXOX      OXOXOXOXOXO    
    XOXOXOXOXOX  XOXOXOXO  XOXOXO  XOXOXOXOXOXOXOX    
    XOXOXOXOXOX  XOXOXOXO  XOXOXO  XOXOXOXOXOXOXOX    
    XOXOXOXOXOX  XOXOXOXO  XOXOXO  XOXOXOXOXOXOXOX    
    XOXOXOXOXOX  XOXOXO      XOXO      XOXOXOXOXOX    
    XOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXO    
    XOXOXOXO        XOXOX   OXOXO      XOXOXOXOXOX    
    XOXOXOXOXOX  XOXOXOX  O  XOXO  OXOXOXOXOXOXOXO    
    XOXOXOXOXOX  XOXOXO       XOX  OXOXOXOXOXOXOXO   
    XOXOXOXOXOX  XOXOXO   X   XOX  OXOXOXOXOXOXOXO    
    XOXOXOXOXOX  XOXOX   OXO   XO      XOXOXOXOXOX    
    XOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXO    
    XOXOXOXO        XO       XOXO      XOXOXOXOXOX    
    XOXOXOXOXOX  XOXOX  OXO  XOXO  XOXOXOXOXOXOXOX    
    XOXOXOXOXOX  XOXOX  OXO  XOXO     XOXOXOXOXOXO    
    XOXOXOXOXOX  XOXOX  OXO  XOXO  XOXOXOXOXOXOXOX    
    XOXOXOXOXOX  XOXOX       OXOX      OXOXOXOXOXO    
    XOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXO
    XOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXOXO    
    \n"
module GameBoard
  @@board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']    
end

class Player
  include GameBoard
  attr_reader :player, :token
  @@player_number
  def initialize(player, token)
    @player = player
    @token = token
  end
end

class TicTacToe
  include GameBoard
  attr_accessor
  @@game_counter = 0
  def initialize(player_one, player_two)
    puts "Time to play! >:)"
    @@game_counter += 1
  end
  
  def start_game(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
end


class TheGame
  def play_a_round()
    
    puts "Player 1, please enter your name:\n"
    player_one = Player.new(gets.chomp, "X")
    puts "Welcome, #{player_one.player}, you are playing as X.\n"
    puts "Player 2, please enter your name:\n"
    player_two = Player.new(gets.chomp, "O")
    puts "Welcome, #{player_two.player}, you are playing as O.\n"
    
    play_game = TicTacToe.new(player_one, player_two)
    board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']   
    play_game.start_game(board)
    turn_taker()
  end

  def turn_taker
    turn_counter = 0
    until turn_counter > 9 do
      if turn_counter % 2 = 0
        play = player_one.token
        puts play
        turn_counter += 1
        puts "Your turn Player 1.\n"
      elsif turn_counter % 2 != 0
        play = player_two.token
        put play
        turn_counter += 1
        puts "Your turn Player 2.\n"
      end
    end
  end
end




play_it = TheGame.new()