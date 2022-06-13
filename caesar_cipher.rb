#Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:

def caesar_cipher(str, shift=1)
  alpha = ("a".."z").to_a
  caesar = ""

  str.each_char do |letter|
    if letter = " "
      caesar += " "
    else  
      old_index = alpha.find_index(letter)
      new_index = (old_index + shift) % alpha.count
      caesar += alpha[new_index]
    end
  end

  caesar
end
