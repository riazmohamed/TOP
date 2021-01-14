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
    attr_accessor :play1, :play2, :sym1, :sym2

    def initialize(play1, play2, sym1, sym2)
      @play1 = play1
      @play2 = play2
      @sym1 = sym1
      @sym2 = sym2
    end

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
    board.display_cell
  end

  def ask_player_a
    ask_player_position(player.play1, player.sym1)
  end

  def ask_player_b
    ask_player_position(player.play2, player.sym2)
  end

end

game = Game.new("Player A", "Player B", "X", "O")
p game.start_game
p game.board.available_positions
p game.ask_player_a
p game.ask_player_b
