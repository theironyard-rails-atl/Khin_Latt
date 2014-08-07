# reference: http://pokemondb.net/pokedex/bulbasaur

class Pokemon
  attr_accessor :moves, :exp, :level
  #include Combat
  def initialize
    @moves = Hash.new
    @exp = 0
    @level = 1
    @type = :normal
  end

end
