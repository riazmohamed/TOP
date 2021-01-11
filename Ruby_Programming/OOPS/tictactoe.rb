# display board and
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

display_board(board_layout)

loop do
  #PLAYER A SELECTION
  puts "Player A: Select your X position:"
  puts "Please choose a value from #{available_positions}"
  marker = gets.chomp.to_i
  board_layout[marker - 1] = "X"
  available_positions.delete(marker)
  display_board(board_layout)
  break if available_positions.empty?

  #PLAYER B SELECTION
  puts "Player B: Select your O position:"
  puts "Please choose a value from #{available_positions}"
  marker = gets.chomp.to_i
  board_layout[marker - 1] = "O"
  available_positions.delete(marker)
  display_board(board_layout)
  break if available_positions.empty?
end

display_board(board_layout)

# TODO
# ====== Start refractoring the values ======
# create a method to prompt the user to enter tthe values
# create edge cases for selection of values (ie Integer 0..9 true/false)
