def foobar(num1,num2)
    if num1 == 20 || num2 ==20
        if num1 == 20
            puts num2
        else 
            puts num1
        end
    else
        puts num1+num2
    end
end

puts("enter 2 numbers: ")
num1 = Integer(gets.chomp)
num2 = Integer(gets.chomp)

foobar(num1,num2)
