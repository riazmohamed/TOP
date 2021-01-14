#tictactoe.rb

class Board
  attr_reader :board

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    puts ""
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts "--+---+--"
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts "--+---+--"
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
    puts ""
  end

  # bring in available position
end

class Display

end

class Game

end

class Player

end

brd = Board.new
p brd.display_board
