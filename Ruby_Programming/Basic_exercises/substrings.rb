# substrings.rb

def substrings(string, dictionary)
  dictionary.reduce(Hash.new(0)) { |hsh, word| hsh[word] += 1 if string.match(word); hsh }
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("Howdy partner, sit down! How's it going?", dictionary)
