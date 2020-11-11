def caesar_cipher(string, skip)
  a = Array("a".."z")
  a_caps = Array("A".."Z")
  a_rotate = a.rotate(skip)
  a_caps_rotate = a_caps.rotate(skip)
  result = string.chars.map do |ele|
    if a.include?(ele)
      a_rotate[a.index(ele)]
    elsif a_caps.include?(ele)
      a_caps_rotate[a_caps.index(ele)]
    else
      ele
    end
  end
  result.join("")
end

p caesar_cipher("What a string!", 5)
