# Write a function that takes an array of numbers (integers for the tests) and a target number. It should find two different items in the array that, when added together, give the target value. The indices of these items should then be returned in a tuple like so: (index1, index2).
#
# For the purposes of this kata, some tests may have multiple answers; any valid solutions will be accepted.
#
# The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will be numbers; target will always be the sum of two different items from that array).
#
# Based on: http://oj.leetcode.com/problems/two-sum/
#
# => twoSum [1, 2, 3] 4 === (0, 2)

def two_sum(numbers, target)
  arr = numbers
  num = target
  index_array = []
  return_array = []
  current_index = 0

  loop do
    idx_counter = current_index
    current_element = arr[current_index]

    loop do
      break if idx_counter >= arr.length - 1
      next_index = idx_counter + 1
      next_element = arr[next_index]
      if current_element + next_element == num
        index_array << current_index << next_index
      end
      idx_counter += 1
    end

    if return_array == []
      current_index += 1
    end
    break if return_array.reduce(:+) == num
  end

  p index_array
end

two_sum([1, 2, 3], 4)
two_sum([1234, 5678, 9012], 14690)
two_sum([2, 2, 3], 4)

=begin
best answer was

def two_sum(numbers, target)
  numbers.combination(2).find { |a, b| a + b == target }
end

=end
