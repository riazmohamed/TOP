# You are given an odd-length array of integers, in which all of them are the same, except for one single number.
#
# Complete the method which accepts such an array, and returns that single different number.
#
# The input array will always be valid! (odd-length >= 3)
#
# Examples
# [1, 1, 2] ==> 2
# [17, 17, 3, 17, 17, 17, 17] ==> 3


# Option 1
def stray(numbers)
  hsh = Hash.new(0)
  numbers.each { |num| hsh[num] += 1 }
  arr = []
  hsh.select { |k, v| arr << k if v == 1 }
  p arr.first
end

stray([1, 1, 2])
stray([17, 17, 3, 17, 17, 17, 17])

# Option 2
puts "=========== OPTION 2 ============="
def stray2(numbers)
  numbers.each { |num| return num if numbers.count(num) == 1 }
end

p stray2([1, 1, 2])
p stray2([17, 17, 3, 17, 17, 17, 17])
