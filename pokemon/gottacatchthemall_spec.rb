require "minitest/autorun"
require "./pokemon.rb"
require "./charmander.rb"
require "./pokedex.rb"
require "./combat.rb"
require "./squirtle.rb"

describe "combat" do
  def setup
    @charmander = Charmander.new
    @squirtle = Squirtle.new
  end

  it "restore hp if go to pokecenter" do
    @charmander.hp = 1
    assert_equal 1, @charmander.hp
    @charmander.go_to_pokecenter
    assert_equal 39, @charmander.hp
  end

  it "hp 0 means it's not alive" do
    assert @charmander.alive?
    @charmander.hp = 0
    assert_equal false, @charmander.alive?
  end

  it "does damage to other pokemon when attacked and return hp" do
    @charmander.battle(@squirtle)
    @squirtle.battle(@charmander)
    13.times {@charmander.battle(@squirtle)}
    assert @squirtle.alive?
    @charmander.battle(@squirtle)
    assert !@squirtle.alive?
    # note: this method will give errors if stats are changed
  end

  it "does damage to my pokemon and go to pokecenter when it faints" do
    @charmander.hp = 0
    @charmander.battle(@squirtle)
    assert_equal @charmander.max_hp, @charmander.hp
  end
end

describe "pokedex" do
  def setup
    @reg = Pokedex.new
    @charmander = Charmander.new
  end

  it "pokedex registers new pokemon" do
    @reg.pokedex << @charmander
    assert @reg.pokedex[0].class == Charmander
  end

  it ""

end

describe "pokemon" do
  it ""

  it ""
end

describe "squirtle" do
  def setup
    @squirtle = Squirtle.new
  end

  it "creates a level 1 squirtle with full hp" do
    assert_equal 44, @squirtle.hp
    assert_equal 1, @squirtle.level
  end

  it "has base attack, defense stats" do
    assert_equal 48, @squirtle.attack
    assert_equal 65, @squirtle.defense
  end
end

describe "charmander" do
  def setup
    @charmander = Charmander.new
  end

  it "creates a level 1 charmander with full hp" do
    assert_equal 39, @charmander.hp
    assert_equal 1, @charmander.level
  end

  it "has base attack, defense stats" do
    assert_equal 52, @charmander.attack
    assert_equal 43, @charmander.defense
  end
end

describe "bulbasaur" do
  it ""

  it ""
end

describe "pikachu" do
  it ""

  it ""
end
