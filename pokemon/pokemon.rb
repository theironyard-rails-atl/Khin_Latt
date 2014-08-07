# reference: http://pokemondb.net/pokedex/bulbasaur

class Pokemon
  attr_accessor :moves, :exp, :level, :print_name
  #include Combat
  def initialize
    @moves = Hash.new
    @exp = 0
    @level = 1
    @type = :normal
  end

  def print_name
    self.class.to_s
  end
end
