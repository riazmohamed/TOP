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

  class Board
    attr_accessor :cell, :available_positions

    WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                    [[1, 5, 9], [3, 5, 7]]              # diagonals

    def initialize
      @cell = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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

    # bring in available position
  end

  class Player
    attr_accessor :play1, :play2, :current_player

    def initialize(play1, play2)
      @play1 = play1
      @play2 = play2
      @current_player = play1
    end

    def swap_turn
      if current_player == play1
        current_player = @play2
      elsif current_player == play2
        current_player = @play1
      end
    end
  end
end

class Game
  include Display
  attr_accessor :board, :player

  def initialize(player1, player2)
    @board = Board.new
    @player = Player.new(player1, player2)
  end

  def start_game
    play_intro
    display_players
    board.display_cell
  end
end

def find_player(play1, play2)
  swap_turn
end

game = Game.new("Player A", "Player B")
p game.start_game
p game.board.available_positions
p game.player.current_player
p game.player.swap_turn
p game.player.current_player
p game.board.available_positions
p game.player.swap_turn
p game.player.current_player
