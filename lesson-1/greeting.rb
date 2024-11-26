def greeting
  puts 'Enter name, surname, age:'

  name = gets.chomp
  surname = gets.chomp
  age = Integer(gets.chomp)

  if age < 18
    puts "Привет #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программированию никогда не рано"
  else
    puts "Привет #{name} #{surname}. Самое время заняться делом!"
  end
end

greeting
