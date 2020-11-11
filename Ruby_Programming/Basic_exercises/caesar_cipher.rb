# caesar_cipher.rb

def caesar_cipher(string, skip)
  a = Array("a".."z")
  arr = string.split("")
  new_arr = []
  l = a.length
  arr.each do |e|
    if a.include?(e.downcase)
      i = a.index(e.downcase)
      a[i + skip] == nil ? new_arr << a[skip - (l - i)] : new_arr << a[i + skip]
    else
      new_arr << e
    end
  end
  new_arr.join("").capitalize
end

p caesar_cipher("What a string!", 5)
