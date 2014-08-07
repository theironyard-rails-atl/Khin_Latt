require "./pokemon.rb"
require "./combat.rb"

class Pikachu < Pokemon
  include Combat
  attr_accessor :hp, :attack, :defense, :max_hp
  attr_reader :type

  def initialize
    super
    @max_hp = 35
    @hp = @max_hp
    @attack = 55
    @defense = 30
    @moves = {Thunder_shock: 40, Tail_Whip: 1}
    @type = :electric
  end

end
