# In this Kata, you will be given a string that may have mixed uppercase and lowercase letters and your task is to convert that string to either lowercase only or uppercase only based on:
#
# make as few changes as possible.
# if the string contains equal number of uppercase and lowercase letters, convert the string to lowercase.
# For example:
# solve("coDe") = "code". Lowercase characters > uppercase. Change only the "D" to lowercase.
# solve("CODe") = "CODE". Uppercase characters > lowecase. Change only the "e" to uppercase.
# solve("coDE") = "code". Upper == lowercase. Change all to lowercase.

def solve(s)
  lowercase_count = s.scan(/[a-z]/).size
  uppercase_count = s.scan(/[A-Z]/).size
  uppercase_count > lowercase_count ? s.upcase : s.downcase
end

p solve("coDe") # = "code"
p solve("CODe") # = "CODE"
p solve("coDE") # = "code"

# Option 2
def solve1(s)
  s.count('A-Z') > s.count('a-z') ? s.upcase : s.downcase
end

puts "\t\v============ OPTION2 ============"
p solve1("coDe") # = "code"
p solve1("CODe") # = "CODE"
p solve1("coDE") # = "code"
