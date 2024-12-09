def deposit(balance)
  loop do
    puts "Enter your deposit (must be greater than 0)"
    cash = gets.chomp.to_f
    if cash > 0
      puts "Success"
      balance += cash
      puts "current balance: #{balance}$"
      break
    else
      puts "Deposit must be greater than 0. Try again"
    end
  end
  balance
end

def withdraw(balance)
  loop do
    puts "Enter withdrawal amount (must be greater than 0 and less than or equal to #{balance}$)"
    cash = gets.chomp.to_f
    if cash > 0 && balance >= cash
      balance -= cash
      puts "Success. Your current balance: #{balance}$"
      break
    elsif cash <= 0
      puts "Withdrawal amount must be greater than 0"
    else
      puts "Withdrawal amount cannot be greater than #{balance}$"
    end
  end
  balance
end

def display_balance(balance)
  puts "current balance: #{balance}$"
end

def quit(balance)
  puts "Program finished"
  File.write("./balance.txt", balance)
end

def main
  balance = if File.exist?("./balance.txt")
    File.read("./balance.txt").to_f
  else
    100.0
  end

  loop do
    puts "What do you want to do?\nD - deposit\nW - withdraw\nB - balance\nQ - quit"
    answer = gets.chomp.downcase
    case answer
    when "q"
      quit(balance)
      break
    when "d"
      balance = deposit(balance)
    when "b"
      display_balance(balance)
    when "w"
      balance = withdraw(balance)
    else
      puts "Invalid choice. Select D, W, B or Q"
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
