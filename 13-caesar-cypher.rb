# Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string. Example:
# caesar_cipher("What a string!", 5) 
# => "Bmfy f xywnsl!"

def caesar_cipher(string, shift)
  # variables
  low_alphabet = Array('a'..'z').to_a
  up_alphabet = Array('A'..'Z').to_a
  stringArray = string.chars
  cipher = ""
  
  # for each character of the string, checks if the lowcase or upcase alphabet includes the character...
  stringArray.each do |char|
    if low_alphabet.include? char
      # then gets the index of the char in the arrays
      i = low_alphabet.index(char)
      # and changes it by adding the shift number (also avoid it from being longer than the alphabet array length)
      shifted = (i + shift) % low_alphabet.length

      cipher << low_alphabet[shifted]
    elsif up_alphabet.include? char
      i = up_alphabet.index(char)
      shifted = (i + shift) % up_alphabet.length

      cipher << up_alphabet[shifted]
    else
      cipher << char
    end
  end
  puts cipher
end

caesar_cipher("What a string!", 5)
