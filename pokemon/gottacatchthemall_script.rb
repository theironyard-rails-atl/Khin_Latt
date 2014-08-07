require "./player.rb"
require "./pokedex.rb"

#--------- Script ----------
def play
  oak_pokedex = Pokedex.new
  oak_pokedex.register(Squirtle.new)
  oak_pokedex.register(Charmander.new)
  oak_pokedex.register(Bulbasaur.new)
  oak_pokedex.register(Pikachu.new)

  puts "\nWelcome to the world of pokemon!\n\n"
  print "What is your name? > "
  name = gets.chomp
  player = Player.new(name)

  my_pokedex = Pokedex.new
  puts "\nHi #{player.name}, my name is Professor Oak. Let's start your adventure. Choose your pokemon!\n\n"

  puts "#{oak_pokedex}"
  print "\nYou are mine, >  "
  x = gets.chomp.downcase
  pokemon1 = oak_pokedex.find_pokemon(x)
  while(pokemon1 == nil)
    print "Invalid pokemon. Choose again! >"
    x = gets.chomp.downcase
    pokemon1 = oak_pokedex.find_pokemon(x)
  end
  my_pokedex.register(pokemon1)

  puts "\nGreat. You chose #{pokemon1.print_name}! #{pokemon1.print_name} is now added to your pokedex."
  puts "\nLet your journey begin...\n\n"
  begin
    print "Press 1 to continue: "
    go = gets.chomp.to_i
  end while(go != 1)

  #---------- fight ----------
  #ai = Player.rb
  while(go == 1)
    enemy = oak_pokedex.pokedex.sample
    puts "\n A wild #{enemy.class} appears!\n\n"

    while(pokemon1.alive? && enemy.alive?)
      pokemon1.battle(enemy)
      enemy.battle(pokemon1)
    end

    if(!pokemon1.alive?)
      pokemon1.start_over
    end

    print "Press 1 for next battle; Press any key to leave"
    go = gets.chomp.to_i
  end
end



play
# require "pry"
# binding.pry
# get the input from player
# squirtle
