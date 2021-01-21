# A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
#
# Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.
#
def panagram?(string)
  Array("a".."z") == string.downcase.scan(/[A-z]/).sort.uniq
end

panagram?("The quick brown fox jumps over the lazy dog.") #=> true

puts "============== OPTION2 =============="
def panagram2?(string)
  p (?a..?z).all? { |e| string.include?(e) }
end

panagram2?("The quick brown fox jumps over the lazy dog.") #=> true

puts "============== OPTION3 =============="
def panagram3?(string)
  p string.downcase.scan(/[A-z]/).uniq.size == 26
end

panagram3?("The quick brown fox jumps over the lazy dog.") #=> true
