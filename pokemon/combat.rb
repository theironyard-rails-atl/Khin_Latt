module Combat
  def battle(other)
    bonus = 2
    other.hp -= ((((((2*self.level/5+2)*self.attack)/other.defense)/50)+2)*bonus*rand(217..255))/255
    #puts "#{self.class}'s health: #{self.hp_left}"
    puts "#{other.class}'s health: #{other.hp_left}"
    if((other.alive? == false) || (self.alive? == false))
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
