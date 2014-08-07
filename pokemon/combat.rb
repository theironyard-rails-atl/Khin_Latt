module Combat
  WEAKNESS = [:grass => :fire, :fire => :water, :water => :electric, :electric => :ground, :ground => [:water, :grass]]
  # require "pry"
  # binding.pry
  include Enumerable
  def battle(other, ai=0)
    if(ai == 0) # user attacks
      puts "Which move should #{self.class} use?"
      i = 0
      x = 0
      move_names = self.moves.collect { |key, value| key }

      move_names.each do |x|
        puts "#{i+1} - #{x.to_s}"
        i += 1
      end

      x = gets.chomp.to_i until(x == 1 || x == 2) # || x == 3 || x == 4)

      move_used = move_names[x - 1]
      bonus = 1 # this should be adjusted with elemental weakness
      other.hp -= ((((((2*self.level/5+2)*self.attack*self.moves[move_used])/other.defense)/50)+2)*bonus*rand(217..255))/255
      #puts "#{self.class}'s health: #{self.hp_left}"
      puts "#{other.class}'s health: #{other.hp_left}"
      if((other.alive? == false) || (self.alive? == false))
        gameover(other)
      end
    else # AI attacks
      
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
    puts "Your pokemon has fainted! Going to pokecenter..."
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
    self.hp = self.max_hp
  end
end
