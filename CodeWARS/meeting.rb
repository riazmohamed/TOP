# s = "Fred:Corwill;Wilfred:Corwill;Barney:Tornbull;Betty:Tornbull;Bjon:Tornbull;Raphael:Corwill;Alfred:Corwill";
# Could you make a program that
#
# makes this string uppercase
# gives it sorted in alphabetical order by last name.
# When the last names are the same, sort them by first name. Last name and first name of a guest come in the result between parentheses separated by a comma.
#
# So the result of function meeting(s) will be:
#
# "(CORWILL, ALFRED)(CORWILL, FRED)(CORWILL, RAPHAEL)(CORWILL, WILFRED)(TORNBULL, BARNEY)(TORNBULL, BETTY)(TORNBULL, BJON)"
# It can happen that in two distinct families with the same family name two people have the same first name too.


s = "Alexis:Wahl;John:Bell;Victoria:Schwarz;Abba:Dorny;Grace:Meta;Ann:Arno;Madison:STAN;Alex:Cornwell;Lewis:Kern;Megan:Stan;Alex:Korn"

# ==> Expected
# "(ARNO, ANN)(BELL, JOHN)(CORNWELL, ALEX)(DORNY, ABBA)(KERN, LEWIS)(KORN, ALEX)(META, GRACE)(SCHWARZ, VICTORIA)(STAN, MADISON)(STAN, MEGAN)(WAHL, ALEXIS)")

# my_solution
def meeting(s)
  new_arr = []
  names_arr = s.split(";").map { |full_name| full_name.scan(/(\w.+):(\w.+)/) }
  names_arr.each {|i| new_arr << [i[0][1].upcase, i[0][0].upcase] }
  sorted = new_arr.sort
  str = ""
  sorted.each do |ele|
    str << "(#{ele[0]}, #{ele[1]})"
  end
  p str
end

meeting(s)

# option 1
puts "\v\t================= OPTION 1 ================="
def meeting1(s)
  p  s.upcase
    .split(";")
    .map { |names| names.split(":") }
    .sort_by { |first, last| [last, first] }
    .map { |first, last| "(#{last}, #{first})" }
    .join
end

meeting1(s)
# option 2
puts "\v\t================= OPTION 2 ================="

# option 3
puts "\v\t================= OPTION 3 ================="
