require "./pokemon.rb"
require "./combat.rb"

class Squirtle < Pokemon
  include Combat
  attr_accessor :hp, :attack, :defense, :max_hp
  attr_reader :type

  def initialize
    super
    @max_hp = 44
    @hp = @max_hp
    @attack = 48
    @defense = 65
    @moves = [Tackle: 35, Tail_Whip: 1]
    @type = :water
  end

end
