def increment_string(input)
  num_arr = []
  str_arr = input.split("")

  loop do
    break if Array("a".."z").include?(str_arr.last)
    num_arr.unshift(str_arr.pop)
  end

  loop do
    break if num_arr[0] != "0"
    str_arr << num_arr.shift if num_arr[0] = "0"
  end

  new_string = ""

  if  str_arr.last == "0" && num_arr.empty? == false
    add = num_arr.join.to_i + 1
    new_string = str_arr.join + add.to_s
  elsif str_arr.last == "0" && num_arr.empty?
    str_arr[-1] = (str_arr[-1].to_i + 1).to_s
    new_string = str_arr.join
  else
    add = num_arr.join.to_i + 1
    new_string = str_arr.join + add.to_s
  end
  
  new_string
end

p increment_string("f00bar1")
p increment_string("f00bar00100")
p increment_string("f00oo")
p increment_string("foobar001")
p increment_string("foobar00")
p increment_string("foobar999")
