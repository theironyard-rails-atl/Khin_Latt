#3
puts "Let's play a guessing game. Shall we?"
print "Guess a number from 0 to 100: "
x = gets.chomp.to_i
comp_num = rand(100)
my_try = 1

while(x != comp_num)
  if(x < comp_num)
    print "Boo! Go higher! Try again: "
  else
    print "Boo! Go lower! Try again: "
  end
  x = gets.chomp.to_i
  my_try += 1
end

puts "There you go! You got it in #{my_try} tries. Better luck next time!"

#3 Reverse
puts "Now, your turn!"
x = gets.chomp.to_i
comp_num = rand(100)
comp_try = 1

while(x != comp_num)
  puts "Computer guessed it wrong #{comp_try} time(s)!"
  if(x < comp_num)
    comp_num = (0 + comp_num) / 2
  else
    comp_num = (comp_num + 100) / 2
  end
  comp_try += 1
end

puts "Computer guessed it in #{comp_try} time(s)!"

if(my_try == comp_try)
  puts "Draw!"
elsif(my_try > comp_try)
  puts "Computer wins! Boo Hoo!"
else
  puts "I win! I am a genius."
end
