require "./pokemon.rb"
require "./combat.rb"

class Bulbasaur < Pokemon
  include Combat
  attr_accessor :hp, :attack, :defense, :max_hp
  attr_reader :type

  def initialize
    super
    @max_hp = 45
    @hp = @max_hp
    @attack = 49
    @defense = 49
    @moves = {Tackle: 35, Tail_Whip: 1}
    @type = :grass
  end

end
