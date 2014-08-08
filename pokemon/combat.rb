module Combat
  WEAKNESS = [:grass => :fire, :fire => :water, :water => :electric, :electric => :ground, :ground => [:water, :grass]]
  # require "pry"
  # binding.pry
  include Enumerable
  def battle(other, ai=false)
    move_names = self.moves.collect { |key, value| key }
    if(!ai) # user attacks
      puts "\nWhich move should #{self.class} use?"
      i = 0
      x = 0
      move_names.each do |x|
        puts "#{i+1} - #{x.to_s}"
        i += 1
      end
      total_moves_count = move_names.length
      print "> "
      x = gets.chomp.to_i until(x.between?(1,move_names.length)) # || x == 3 || x == 4)
      move_used = move_names[x - 1]
      puts "\n#{self.class} uses #{move_used}!"
    else # AI attacks
      move_used = move_names[ rand(0..(move_names.length - 1)).to_i ]
      puts "\nWild #{self.class} uses #{move_used}!"
    end
    bonus = 1 # this should be adjusted with elemental weakness
    other.hp -= ((((((2*self.level/5+2)*self.attack*self.moves[move_used])/other.defense)/50)+2)*bonus*rand(217..255))/255

    print "Wild " if(other.hp_left > 0 && !ai)
    puts "#{other.class}'s health: #{other.hp_left}" if(other.hp_left > 0)

    if((self.alive? && !other.alive?))
      puts "\n#{self.class} defeated #{other.class}."
      print "Do you want to go to the Pokecenter? (y/n) \n >" #this might not need it
      heal = gets.chomp until(heal == 'y' || heal == 'n')
      go_to_pokecenter if(heal == 'y')
      gameover(other)
    end
  end

  def gameover(other)
    if(other.alive? == false)
      gain_exp
    end
  end

  def gain_exp
    self.exp = self.level * 20
  end

  def start_over
    puts "Your pokemon has fainted!"
    go_to_pokecenter
  end

  def gain_level?

  end

  def hp_left
    self.hp
  end

  def alive?
    self.hp > 0
  end

  def go_to_pokecenter
    puts "Going to pokecenter..."
    self.hp = self.max_hp
  end
end
