# caesar_cipher.rb

def caesar_cipher(string, skip)
  a = Array("a".."z")
  a_caps = Array("A".."Z")
  l = a.length
  new_arr = string.split("").map do |element|
    if a.include?(element)
      i = a.index(element)
      a[i + skip] == nil ? a[skip - (l - i)] : a[i + skip]
    elsif a_caps.include?(element)
      i = a_caps.index(element)
      a_caps[i + skip] == nil ? a_caps[skip - (l - i)] : a_caps[i + skip]
    else
      element
    end
  end
  new_arr.join("")
end

p caesar_cipher("What a string!", 5)
