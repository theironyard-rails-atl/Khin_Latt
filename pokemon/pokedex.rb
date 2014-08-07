require "./squirtle.rb"
require "./charmander.rb"

class Pokedex
  attr_accessor :pokedex

  def initialize
    @pokedex = []
    register
  end

  def to_s
    @pokedex.map do |x|
      x.class.to_s
    end.to_s
  end

  def register
    @pokedex << Squirtle.new
    @pokedex << Charmander.new
  end

  def find_pokemon(name)
    @pokedex.find { |p| p.class.to_s.downcase == name }
  end

  def show_stats

  end
end
