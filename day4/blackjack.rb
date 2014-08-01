class Card
  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def value
    case @value
    when (2..10)
      @value
    when :K, :Q, :J
      10
    when :A
      ace
    end
  end

  def ace
    1 #should return 1 or 11
  end
end

# Card(2, :D)

class Deck

  attr_reader :cards


  def initialize
    @cards = []
    @nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
    @suits = [:D, :S, :H, :C]
    new_card
  end

  def new_card
    @nums.each do |x|
      @suits.each do |y|
        @cards << Card.new(x, y)
      end
    end
  end

end

class Hand



end

class Person
  attr_accessor :wallet
  def initialize(wallet)
    @wallet = wallet
  end

  def transfer(money)
    @wallet += money
  end
end

#--------- Running Script ----------
# player = Person.new(100)
