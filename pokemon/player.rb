class Player
  attr_accessor :my_pokemon
  attr_reader :name

  def initialize(name)
    @my_pokemon = []
    @name = name
  end
end
