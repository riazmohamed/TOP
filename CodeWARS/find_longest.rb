# Find the number with the most digits.
#
# If two numbers in the argument array have the same number of digits, return the first one in the array.

def find_longest(array)
  hsh = {}
  array.each do |num|
    hsh.has_key?(num.to_s.length) ? hsh[num.to_s.length] << num : hsh[num.to_s.length] = [num]
  end
 p hsh[hsh.keys.max].first
end

 arr = [23139832572768364, 479742, 268499505280604689, 1799325057279, 2336845080826, 39955, 2, 25727512642200757499, 156454462865, 7620, 1, 421065586929254051, 193813551, 25739, 99731, 145900624, 842922909, 997296, 7203521234285, 5622373, 53609486946109, 7, 8772533714937, 731709, 7891, 77509939235002533, 72, 94485901156695340012, 7998499581599652308, 510598, 241646708118091144, 60146801181984099, 9, 76785772425454146, 71911, 42665, 9336347643] # =>  Expected: 25727512642200757499

 find_longest(arr)

 # Option 2
 puts "=========== OPTION 2 ============="

 def option2(arr)
   arr.max_by { |num| num.to_s.length }
 end

 p option2(arr)
