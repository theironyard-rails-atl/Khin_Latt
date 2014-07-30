#2
#2-1
def grade(num)
  if(num >= 90)
    "A"
  elsif(num >= 80)
    "B"
  elsif(num >= 70)
    "C"
  elsif(num >= 60)
    "D"
  else
    "F"
  end
end

puts grade(90)

#2-2
def students(num)
  array = []
  num.times { array << rand(0..100) }
  puts "#{array}"
  return array
end

students(5)

#2-3
def how_many_A(array)
  count = 0
  array.each do |x|
    count += 1 if(grade(x) == "A")
  end
  puts "#{count} A('s)!"
  return count
end

how_many_A(students(25))

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
    comp_num = (0 + comp_num) / 2 #this is probably the best strategy for the computer
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


#4
class Shopping_Cart
  def initialize
    @my_cart = Hash.new
  end

  def add(name, price)
    @my_cart[name] = price
  end

  def remove(name)
    @my_cart.delete(name)
  end

  def checkout
    price = 0
    puts "Here is your cart: "
    @my_cart.each do |key, value|
      price += value
      puts "#{key}     $#{value}"
    end
    price = price * 1.07     # 7% tax
    price = price * 0.9 if price > 100.00 #overrides for discount
    puts "Your total is $#{price.round(2)}. Thank you for shopping with us!"
  end
end

a = Shopping_Cart.new
a.add(:first_item, 59.99)
a.add(:second_item, 65.30)
a.checkout
a.remove(:first_item)
a.checkout

#5
# Hangman game should let the first user to enter a word; then shows _ _ _ based
# on the number of letters; then second user/player is prompted to start guessing
# and if s/he guesses right, each corresponding underscore should display the letter.
# so I should think about letters rather than a string.
