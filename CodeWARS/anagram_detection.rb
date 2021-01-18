# create an anagram between the test and the original
# My solution => to capture the test and the original in a hsh and then compare
def is_anagram(test, original)
  hsh1 = {}
  hsh1.default = 0
  test.downcase.split("").sort.each { |l| hsh1[l] += 1 }

  hsh2 = {}
  hsh2.default = 0
  original.downcase.split("").sort.each { |l| hsh2[l] += 1 }

  p hsh1 == hsh2
end

is_anagram("Creative", "Reactive")
puts "---------------------------------"
is_anagram("XuGksOkI", "OuGksIk")
puts "---------------------------------"
is_anagram("dumble", "bumble")
puts "---------------------------------"
is_anagram("SKRsYjBlZBH", "ZjlSuHNhFBs")
puts "---------------------------------"
is_anagram("mHnkuccLVZJn", "AsReJkycmqCO")

# other Option much simpler
puts "========== Option 2 ============"
def is_anagram2(test, original)
  p test.downcase.chars.sort == original.downcase.chars.sort
end

is_anagram2("Creative", "Reactive")
puts "---------------------------------"
is_anagram2("XuGksOkI", "OuGksIk")
puts "---------------------------------"
is_anagram2("dumble", "bumble")
puts "---------------------------------"
is_anagram2("SKRsYjBlZBH", "ZjlSuHNhFBs")
puts "---------------------------------"
is_anagram2("mHnkuccLVZJn", "AsReJkycmqCO")
