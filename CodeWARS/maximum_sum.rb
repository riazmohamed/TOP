require 'pry'

=begin
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array or list of integers:
=end

# def max_sequence(arr)
#   #your code here
# end
#
# maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# -- should be 6: [4, -1, 2, 1]
# Dynamic programming
# range that has the largest sum
# A is entirely positive array then - take the whole set
# A is entirely negative then take the maximum
# Proof of optimal substructure

=begin
  - create a new array
  - add the first number as the first element
  - check if the first number is greater than the first number
  - if the second number is greater than the first number add it to the array
  -


PEDAC
Understand The problem
  * input
  - given an array of numbers

  * output
  - maximum sum of sum of a contiguous subsequence
  - ie the range which produces a maximum value in sequence
  - should return the maximum sum

  * explicit requirements
  - if the array does not have any negative value
    - result = sum of the array
  - if the array is empty then the sum = 0
  - if the araay is made up of negative numbers only then result = 0
  - only integers involved

  Example test cases
  1. when the whole array is made up of negative integers
    - arr = [-1, -2, -3, -4, -5]
    - result = 0
  2. when the whole array is made up of positive integers
    - arr = [1, 2, 3, 4, 5]
    - result = 15
  3. when the array is an empty array
    - arr = []
    - result = 0
  4. when the array is made up of both positive and negative elements(integers)
    - arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
    result = 6     #=> [4, -1, 2, 1]

    Problem Breakdown
          # (-2 + 1) or (1) which is greater = 1,
          # (1 + -3) or (-3) which is greater = -2,
          # (-2 + 4) or (4), which is greater = 4
          # (4 - 1) or (-1) which is greater = 3,
          # (3 + 2) or (2) which is greater = 5,
          # (5 + 1) or (1) which is greater = 6,    # Answer
          # (6 - 5) or (-5) which is greater = 1,
          # (1 + 4) or (4) which is greater = 5


  Data structure
    Array and Integers

  Algorithm/ Logic
  - if all the elements are negative or if the array is empty then sum is 0
  - if all the elements are positive then the sum is sum of all the elements
  - the following logic is when  the array has both +ve & -ve elements
    - initialize a variable called "sum" and assig the sum of the first two elements to it
    - if their sum is greater than the second element then store the sum in a variable lets say "sum"
    - if the sum is lesser than the addition of sum to the second element then assign sum = second element
    - repeat the above for all new pairs untill the last element is reached
    - output the final value

  Code with intent



=end

def max_sequence(*arr)
  # sum = max = 0
  # for i in 0...arr.length
  #    sum += arr[i]; sum = 0 if sum < 0; max = sum if sum > max
  #  end
  # max

  # return 0 if arr.all?(&:negative?) || arr.empty?
  # (1..arr.length).map { |i| arr.each_cons(i).map { |a| a.sum }.max }.max

  # arr.reduce([0,0]) do |accumulator, i|
  #   accumulator[1] += i
  #   [accumulator.max,[0,accumulator[1]].max]
  # end.max
  return [] if arr.empty?
  arr.reduce([0, 0]) { |a, i| a[1] += i; [a.max, [0, a[1]].max] }.max
end

p max_sequence(-2, 1, -3, 4, -1, 2, 1, -5, 4)
p max_sequence(-1, -2, -3)
p max_sequence()
