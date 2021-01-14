#tictactoe.rb

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

puts "Player A your sign is 'X'"
puts "Player B your sign is 'O'"

board_layout = [1, 2, 3, 4, 5, 6, 7, 8, 9]
available_positions = board_layout.select { |num| num.to_i != 0 }

def display_board(board)
  puts ""
  puts "#{board[0]} | #{board[1]} | #{board[2]}"
  puts "--+---+--"
  puts "#{board[3]} | #{board[4]} | #{board[5]}"
  puts "--+---+--"
  puts "#{board[6]} | #{board[7]} | #{board[8]}"
  puts ""
end

def prompt_user(player_name, symbol, available_positions)
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

def check_winner(user_input_number)
  count = 0
  arr = []
  WINNING_LINES.each do |win|
    count = 0
    win.each do |num|
      if user_input_number.include?(num)
        count += 1
        arr = win if count == 3
      end
    end
    arr
  end
  arr
end

display_board(board_layout)

input_A = []
input_B = []
loop do
  #PLAYER A SELECTION
  player_sign = 'X'
  current_player = "Player A"
  marker = prompt_user(current_player, player_sign, available_positions)
  board_layout[marker - 1] = player_sign
  input_A << marker
  # winning condition
  if input_A.length > 2 && WINNING_LINES.include?(check_winner(input_A))
    puts "Player A wins!!!"
    break
  end

  available_positions.delete(marker)
  if available_positions.empty?
    puts "It is a DRAW!!!"
    break
  end
  display_board(board_layout)

  #PLAYER B SELECTION
  player_sign = 'O'
  current_player = "Player B"
  marker = prompt_user(current_player, player_sign, available_positions)
  input_B << marker
  board_layout[marker - 1] = player_sign
  # winning condition
  if input_B.length > 2 && WINNING_LINES.include?(check_winner(input_B))
    puts "Player B wins!!!"
    break
  end

  available_positions.delete(marker)
  if available_positions.empty?
    puts "It is a DRAW!!!"
    break
  end
  display_board(board_layout)
end

display_board(board_layout)
