#tictactoe.rb

module Display
  def play_intro
    puts "Let's play TICTACTOE !!!"
  end

  def ask_name
    puts "Please enter player name: "
  end

  def user_input_warning
    puts "Invalid option!!! Select an Integer from"
  end

  class Board
    attr_accessor :cell

    WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                    [[1, 5, 9], [3, 5, 7]]              # diagonals

    def initialize
      @cell = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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

  end
end

class Game
  include Display
  attr_accessor :board

  def initialize
    @board = Board.new
  end

end


game = Game.new
p game.board.display_cell
