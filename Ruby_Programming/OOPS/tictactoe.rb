# display board and
# created player A and B
# refractored prompt for user input
#

puts "Player A your sign is 'X'"
puts "Player B your sign is 'O'"

board_layout = [1, 2, 3, 4, 5, 6, 7, 8, 9]
available_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]

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

display_board(board_layout)
loop do
  #PLAYER A SELECTION
  player_sign = 'X'
  current_player = "Player A"
  marker = prompt_user(current_player, player_sign, available_positions)
  board_layout[marker - 1] = player_sign
  available_positions.delete(marker)
  display_board(board_layout)
  break if available_positions.empty?

  #PLAYER B SELECTION
  player_sign = 'O'
  current_player = "Player B"
  marker = prompt_user(current_player, player_sign, available_positions)
  board_layout[marker - 1] = player_sign
  available_positions.delete(marker)
  display_board(board_layout)
  break if available_positions.empty?
end

display_board(board_layout)

# TODO
# ====== Start refractoring the values ======
# create a method to prompt the user to enter tthe values
# create edge cases for selection of values (ie Integer 0..9 true/false)
