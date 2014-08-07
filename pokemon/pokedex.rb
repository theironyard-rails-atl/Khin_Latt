require "./squirtle.rb"
require "./charmander.rb"
require "./bulbasaur.rb"
require "./pikachu.rb"

class Pokedex
  attr_reader :pokedex

  def initialize
    @pokedex = []
  end

  def to_s
    @pokedex.map do |x|
      x.class.to_s
    end.join("  ")
  end

  def register pokemon
    @pokedex << pokemon
  end

  def find_pokemon(name)
    @pokedex.find { |p| p.class.to_s.downcase == name }
  end

  def show_stats

  end
end
