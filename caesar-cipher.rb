def char_shift(char, shift, range)
  relative_shift = (char.ord - range.min.ord + shift) % range.count
  (range.min.ord + relative_shift).chr
end

def caesar_cipher(message, shift)
  cipher = ""
  message.each_char do |char|
    if ('a'..'z').include? char
      char = char_shift(char, shift, ('a'..'z'))
    elsif ('A'..'Z').include? char
        char = char_shift(char, shift, ('A'..'Z'))
    end
    cipher += char
  end
  cipher
end

# main
message = "What a string!"
puts "Message: " + message
puts "Cipher : " + caesar_cipher(message, 5)

# tests
puts caesar_cipher('z',0) == 'z'
puts caesar_cipher('z',1) == 'a'
puts caesar_cipher('Z',0) == 'Z'
puts caesar_cipher('Z',1) == 'A'
puts caesar_cipher(',',1) == ','