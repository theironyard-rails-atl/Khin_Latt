require "./player.rb"
require "./pokedex.rb"

#--------- Script ----------



puts "Welcome to the world of pokemon!"
print "What is you name? "
player = gets.chomp
player = Player.new
pokedex = Pokedex.new
puts "#{pokedex}"
# get the input from player
# squirtle
