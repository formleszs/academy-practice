def search(age)
  bio = "task2_file.txt"
  res = File.open("result.txt", "a")
  buffer = File.open("buffer.txt", "w")
  File.foreach(bio) do |person|
    if person[-3, 2].to_i == age
      res.puts(person)
    else
      buffer.puts(person)
    end
  end
  buffer.close
  File.write(bio, File.read(buffer))
  File.delete(buffer)
  res.close
end

def index
  res = "result.txt"
  File.foreach(res) { |person| puts person }
end

def main
  puts "type age (-1 to exit):"
  age = gets.chomp.to_i
  while age != -1
    search(age)
    if File.size("task2_file.txt") == 0
      puts "All students was written in file"
      break
    end
    puts "type age (-1 to exit):"
    age = gets.chomp.to_i
  end
  index
end

main if __FILE__ == $PROGRAM_NAME
