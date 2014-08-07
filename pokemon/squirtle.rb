require "./pokemon.rb"
require "./combat.rb"

class Squirtle < Pokemon
  include Combat
  attr_accessor :hp, :attack, :defense, :max_hp

  def initialize
    super
    @max_hp = 44
    @hp = @max_hp
    @attack = 48
    @defense = 65
    @moves = ["Tackle", "Tail Whip"]
  end

end
