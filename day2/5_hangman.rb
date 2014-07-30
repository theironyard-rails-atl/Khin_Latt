#5
require "pry"
puts "Let's play hangman! This game is aimed for at least two players."
puts "It's time for player 1; player 2, look away now!"
print "Input a word: "
answer = gets.chomp.to_s.downcase.chars
num_letters = answer.length
puts "Player 2, let's play."
puts "Make a guess: "
puts "Word to be guessed: "

keyhash = Hash.new
i = 0
num_letters.times do
  print "_ "
  keyhash[i.to_s] = answer[i]
  i += 1
end

puts ""

gameover = false
while(gameover == false)
#think about using the keyhash[].to_i to show correct letters










  gameover = true
end

binding.pry
