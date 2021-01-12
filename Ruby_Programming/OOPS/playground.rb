require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
test_result = [1, 2, 4, 5, 6]

count = 0
arr = []
WINNING_LINES.each do |win|
  count = 0
  win.each do |num|
    if test_result.include?(num)
      count += 1
      arr = win if count == 3
      # binding.pry
    end
  end
  arr
end

# p count
p arr
