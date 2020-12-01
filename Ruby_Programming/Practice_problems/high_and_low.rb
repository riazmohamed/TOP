# high_and_low.rb
# attempt 1
def high_and_low(numbers)
  arr =  numbers.split(" ").map { |a| a.to_i}.sort
  "#{arr.last.to_s} #{arr.first.to_s}"
end

# attempt 2
# def high_and_low(numbers)
#   numbers.split.map(&:to_i).minmax.reverse.join(' ')
# end

# return the highest and the lowest number as follows.
p high_and_low("1 2 3 4 5")  # return "5 1"
p high_and_low("1 2 -3 4 5") # return "5 -3"
p high_and_low("1 9 3 4 -5") # return "9 -5"
