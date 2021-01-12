#tictactoe.rb

module TicTacToe
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  puts "Player A your sign is 'X'"
  puts "Player B your sign is 'O'"

end

class Board
  attr_accessor :board_layout, :available_positions
  include TicTacToe

  def initialize(board_layout, available_positions)
    @board_layout = board_layout
    @available_positions = available_positions
  end

  def display_board
    puts ""
    puts "#{board_layout[0]} | #{board_layout[1]} | #{board_layout[2]}"
    puts "--+---+--"
    puts "#{board_layout[3]} | #{board_layout[4]} | #{board_layout[5]}"
    puts "--+---+--"
    puts "#{board_layout[6]} | #{board_layout[7]} | #{board_layout[8]}"
    puts ""
  end
end

class Prompt < Board
  attr_accessor :player_name, :symbol

  def initialize(player_name, symbol)
    @player_name = player_name
    @symbol = symbol
  end

  def prompt_user
    user_input = ""
    puts "#{player_name}: Select your #{symbol} position:"
    loop do
      puts "Please choose a value from #{available_positions}"
      user_input = gets.chomp.to_i
      break if available_positions.include?(user_input)
      puts "Invalid option!!! Select an Integer from #{available_positions}"
    end
    user_input
  end
end

board_layout = [1, 2, 3, 4, 5, 6, 7, 8, 9]
available_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]

brd = Board.new(board_layout, available_positions)
puts brd.display_board
