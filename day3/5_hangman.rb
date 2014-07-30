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

output = ""
keyhash = Hash.new
i = 0
num_letters.times do
  keyhash[i] = answer[i]
  output.concat(" _")
  i += 1
end

i -= 1
puts output
puts ""

gameover = false
while(gameover == false)
#think about using the keyhash[] to show correct letters

#if match then print letter, else print _








  gameover = true
end


def refresh(input)
  if()

  end
end


binding.pry
