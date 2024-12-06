def message(word)
  if word[-2, 2].downcase == "cs"
    2**word.size

  else
    word.reverse
  end
end

puts("Type a word: ")
word = gets.chomp
puts message(word)
