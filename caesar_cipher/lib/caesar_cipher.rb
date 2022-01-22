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
