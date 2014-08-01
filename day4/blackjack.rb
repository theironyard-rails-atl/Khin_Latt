class Card
  attr_reader :ace
  attr_reader :value
  attr_reader :special_value

  def initialize(value, suit)
    @ace = :A if value == :A
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
      1
    end
  end

  def to_s
    "#{@value}#{@suit}"
  end
end



class Deck

  attr_reader :cards, :drawn

  def initialize
    @cards = []
    @nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
    @suits = [:D, :S, :H, :C]
    new_card
    @drawn = []
  end

  def new_card
    @nums.each do |x|
      @suits.each do |y|
        @cards << Card.new(x, y)
      end
    end
    shuffle
  end

  def shuffle
    @cards.shuffle!
  end

  def draw
    x = @cards.pop
    @drawn << x
    return x
  end

end


class Hand
  attr_reader :value
  def initialize
    @value = 0
    @ace_array = []
    @num_ace = 0
    @num_draw = 0
    @inhand = []
  end

  def add(*args)
    args.each do |card|
      @inhand << card
      if(card.ace == :A) #fix this to take from Deck
        @num_draw += 1
        @ace_array << card.ace
        @num_ace += 1
        @value = @value + card.value + 10
      else
        @num_draw += 1
        @value += card.value
      end
      check_sum_ace
    end
  end

  def check_sum_ace
    if((@value > 21) && (@num_ace >= 1))
      @value -= 10
    end
  end

  def busted?
    @value > 21
  end

  def blackjack?
    if((@num_draw == 2) && (@value == 21))
      true
    end
  end

  def to_s
    card_strings = []
    @inhand.each { |card| card_strings << card.to_s }

    # card_strings = @inhand.map { |card| card.to_s } # ******

    card_strings.join(", ") # ******
  end
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
if __FILE__ == $PROGRAM_NAME #this loop is so that you don't comment it out when you run spec
  puts "Let's play blackjack!"
  player = Person.new(100)
  stop = 0
  while((player.wallet > 0) && (stop != 1)) do
    hit = 0
    stay = 0

    dealer_hand = Hand.new
    my_hand = Hand.new
    deck = Deck.new

    dealer_hand.add(deck.draw)
    my_hand.add(deck.draw)
    dealer_hand.add(deck.draw)
    my_hand.add(deck.draw)

    print "Dealer's hand: "
    puts dealer_hand.to_s

    puts dealer_hand.value

    print "My hand: "
    puts my_hand.to_s
    puts my_hand.value


    puts "Cards left in the deck: #{deck.cards.count}"
    require "pry"
    binding.pry













  print "Enter 1 to stop: "
  stop = gets.chomp.to_i
  end
  puts "DONE!"
end
# deck = Deck.new
# drawn_card = deck.draw
# puts "#{drawn_card.value} #{drawn_card.suit}"
