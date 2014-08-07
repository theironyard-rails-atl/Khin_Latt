require "./pokemon.rb"
require "./combat.rb"

class Charmander < Pokemon
  include Combat
  attr_accessor :hp, :attack, :defense, :max_hp

  def initialize
    super
    @max_hp = 39
    @hp = @max_hp
    @attack = 52
    @defense = 43
    @moves = ["Growl", "Scratch"]
  end


end
