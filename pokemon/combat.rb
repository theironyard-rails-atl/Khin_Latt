module Combat
  def attack(other)

  end

  def hp_left

  end

  def alive?
    self.hp > 0
  end

  def go_to_pokecenter
    self.hp = self.max_hp
  end
end
