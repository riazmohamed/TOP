#tictactoe.rb

module Display
  def play_intro
    puts "\nLet's play TICTACTOE !!!\n\n"
  end

  def display_players
    puts "Player A your sign is 'X'"
    puts "Player B your sign is 'O'"
  end

  def user_input_warning
    puts "Invalid option!!! Select an Integer from"
  end

  def ask_player_position(player_name, symbol)
    puts "#{player_name}: Select your #{symbol} position:"
  end

  def mark_position(position)
    puts "Please choose a value from #{position}"
  end

  class Board
    attr_accessor :cell, :available_positions

    WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                    [[1, 5, 9], [3, 5, 7]]              # diagonals

    def initialize
      @cell = [1, 2, 3, 4, 5, 6, 7, 8, 9] #update cell when the user inputs a valid option
    end

    def available_positions
      available_positions = cell.select { |num| num.to_i != 0 }
    end

    def display_cell
      puts ""
      puts "#{cell[0]} | #{cell[1]} | #{cell[2]}"
      puts "--+---+--"
      puts "#{cell[3]} | #{cell[4]} | #{cell[5]}"
      puts "--+---+--"
      puts "#{cell[6]} | #{cell[7]} | #{cell[8]}"
      puts ""
    end

  end

  class Player
    attr_accessor :play1, :play2, :sym1, :sym2,
                  :current_player, :current_symbol

    def initialize(play1, play2, sym1, sym2)
      @play1 = play1
      @play2 = play2
      @sym1 = sym1
      @sym2 = sym2
      @current_player = play1
      @current_symbol = sym1
    end

    def swap_players
      if current_player == play1
        self.current_player = play2
        self.current_symbol = sym2
      elsif current_player == play2
        self.current_player = play1
        self.current_symbol = sym1
      end
    end
     # without adding self keyword ruby seems to create a new local variable within the above method
  end
end

class Game
  include Display
  attr_accessor :board, :player

  def initialize(player1, player2, symbol1, symbol2)
    @board = Board.new
    @player = Player.new(player1, player2, symbol1, symbol2)
  end

  def start_game
    play_intro
    display_players
  end

  def show
    board.display_cell
  end

  def ask_player
    ask_player_position(player.current_player, player.current_symbol)
  end

end

game = Game.new("Player A", "Player B", "X", "O")
p game.start_game
game.show
p game.board.available_positions

user_input = ""
loop do
  game.ask_player
  game.mark_position(game.board.available_positions)
  user_input = gets.chomp.to_i
  if game.board.available_positions.include?(user_input)
    game.board.cell[user_input - 1] = game.player.current_symbol
    break
  end
end
p game.board.cell
game.show
