#tictactoe.rb

module Display

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def play_intro
    puts "\nLet's play TICTACTOE !!!\n\n"
  end

  def display_players
    puts "Player A your sign is 'X'"
    puts "Player B your sign is 'O'"
  end

  def user_input_warning
    puts "\v\tInvalid option!!! Select an Integer from\n\n"
  end

  def ask_player_position(player_name, symbol)
    puts "#{player_name}: Select your #{symbol} position:"
  end

  def mark_position(position)
    puts "Please choose a value from #{position}"
  end

  class Board
    attr_accessor :cell, :available_positions

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

  def get_user_input
    user_input = ""
    loop do
      ask_player
      mark_position(board.available_positions)
      user_input = gets.chomp.to_i
      if board.available_positions.include?(user_input)
        board.cell[user_input - 1] = player.current_symbol
        break
      else
        user_input_warning
      end
    end
    user_input
  end

  def check_winner(user_input_numbers)
    count = 0
    arr = []
    WINNING_LINES.each do |win|
      count = 0
      win.each do |num|
        if user_input_numbers.include?(num)
          count += 1
          arr = win if count == 3
        end
      end
      arr
    end
    arr
  end

  def winning_condition(user_input_number)
    if user_input_number.length > 2 && WINNING_LINES.include?(check_winner(user_input_number))
    "\v\t#{player.current_player} wins!!!\n"
    end
  end

  def player_turn(input_array)
    input_array << get_user_input
    show
  end

end

game = Game.new("Player A", "Player B", "X", "O")
input_a = []
input_b = []

p game.start_game
game.show
p game.board.available_positions

game.player_turn(input_a)

loop do
  game.player.swap_players
  game.player_turn(input_b)
  if game.winning_condition(input_b)
    puts game.winning_condition(input_b)
    break
  end

  game.player.swap_players
  game.player_turn(input_a)
  if game.winning_condition(input_a)
    puts game.winning_condition(input_a)
    break
  end

  if game.board.available_positions.empty?
    puts "\v\tIt is a DRAW!!!\n\n"
    break
  end
end

game.show
