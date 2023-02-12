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

class TicTacToe
  attr_reader :board, :player_1, :player_2

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @player_1 = Player.new("X")
    @player_2 = Player.new("O")
    @score = { player_1.marker => 0, player_2.marker => 0 }
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def play
    current_player = player_1
    loop do
      display_board
      puts "#{current_player.marker}'s turn. Choose a position (1-9) to place your marker."
      position = gets.chomp.to_i
      if board[position - 1] == ' '
        board[position - 1] = current_player.marker
        if win?(current_player.marker)
          display_board
          puts "#{current_player.marker} wins!"
          break
        elsif draw?
          display_board
          puts "It's a draw."
          break
        else
          current_player = current_player == player_1 ? player_2 : player_1
        end
      else
        puts "Position already taken. Choose another position."
      end
    end
    new_game
  end

  private

  WINNING_COMBOS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def win?(marker)
    WINNING_COMBOS.any? do |combo|
      combo.all? { |index| board[index] == marker }
    end
  end

  def draw?
    board.none? { |square| square == ' ' }
  end

  def new_game
    puts "Would you like to play again? (yes/no)"
    response = gets.chomp.downcase
    if response == "yes"
      @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      play
    elsif response == "no"
      puts "Thanks for playing!"
      exit
    else
      puts "Invalid response. Please type 'yes' or 'no'."
      new_game
    end
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

game = TicTacToe.new
game.play
