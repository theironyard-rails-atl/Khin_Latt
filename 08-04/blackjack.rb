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
      11
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
  attr_reader :value, :show
  def initialize
    @value = 0
    @num_ace = 0
    @num_draw = 0
    @inhand = []
    @current_ace = false
  end

  def add(*args)
    args.each do |card|
      @inhand << card
      if(card.ace == :A)
        @current_ace = true
        @num_ace += 1
      end
      @value += card.value
      @num_draw += 1
      check_sum_ace
      @current_ace = false
    end
  end

  def show
    @inhand[1..-1].map { |card| card.to_s }.join(", ")
  end

  def check_sum_ace
    while @value > 21 && @num_ace > 0
      @value -= 10
      @num_ace -= 1
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
  attr_accessor :hand
  def initialize
    @hand = Hand.new
  end
end

class Player < Person
  attr_accessor :wallet

  def initialize
    @wallet = 100
    super
  end
end

class Dealer < Person
  attr_reader :hand
  def initialize
    super
  end
end

class Blackjack
  attr_reader :play

  def initialize
    @player = Player.new
  end

  def play
    play_round
  end

  def play_round
    puts "Let's play blackjack!"
    stop = 0

    while((@player.wallet > 0) && (stop != 1)) do
      hitorstay = 0
      roundend = false
      @dealer = Dealer.new
      @deck = Deck.new
      @player.hand = Hand.new
      print "What amount would you like to bet on? "
      bet = gets.chomp.to_i

      while(bet > @player.wallet)
        print "Only bet within your budget please: "
        bet = gets.chomp.to_i
      end

      #Five cards Charlie rule not included in this game
      @dealer.hand.add(@deck.draw)
      @player.hand.add(@deck.draw)
      @dealer.hand.add(@deck.draw)
      @player.hand.add(@deck.draw)
      @dealer.hand.add(@deck.draw) until(@dealer.hand.value >= 17)

      # ASK JAMES!!!
      # def printout
      #   puts "Dealer's hand: #{dealer_hand.to_s}"
      #   puts "Your hand: #{my_hand.to_s}"
      #   puts "Cards left in the deck: #{deck.cards.length}"
      # end

      if(@dealer.hand.busted?)
        puts "Dealer is busted!"
        puts "Dealer's hand: #{@dealer.hand.to_s}"
        puts "Your hand: #{@player.hand.to_s}"
        roundend = true
        @player.wallet += bet
        #puts "Cards left in the deck: #{deck.cards.length}"
      elsif(@dealer.hand.blackjack?)
        puts "BlackJack! Dealer won!"
        puts "Dealer's hand: #{@dealer.hand.to_s}"
        puts "Your hand: #{player.hand.to_s}"
        roundend = true
        @player.wallet -= bet
        #puts "Cards left in the deck: #{deck.cards.length}"
      elsif(@player.hand.blackjack?)
        puts "BlackJack! You won!"
        puts "Dealer's hand: #{@dealer.hand.to_s}"
        puts "Your hand: #{player.hand.to_s}"
        roundend = true
        @player.wallet += bet
        #puts "Cards left in the deck: #{deck.cards.length}"
      else
        puts "Dealer's hand: #{@dealer.hand.show}"
        puts "Your hand: #{@player.hand.to_s}"
        while((@player.hand.value <= 21) && (!roundend))
          #puts "Cards left in the deck: #{deck.cards.length}"
          print "Hit (Press 1) or Stay (Press 2): "
          hitorstay = gets.chomp.to_i
          if(hitorstay == 1)
            @player.hand.add(@deck.draw)
            puts "Your hand: #{@player.hand.to_s}"
            if(@player.hand.busted?)
              puts "Busted! You lose!"
              puts "Dealer's hand: #{@dealer.hand.to_s}"
              roundend = true
              @player.wallet -= bet
            end
          elsif(hitorstay == 2)
            if(@player.hand.value == @dealer.hand.value)
              puts "Tie!"
              puts "Dealer's hand: #{@dealer.hand.to_s}"
            elsif(@player.hand.value > @dealer.hand.value)
              puts "You won!"
              puts "Dealer's hand: #{@dealer.hand.to_s}"
              @player.wallet += bet
            else
              puts "You lose!"
              puts "Dealer's hand: #{@dealer.hand.to_s}"
              @player.wallet -= bet
            end
            roundend = true
          end
        end
      end

      puts "Your wallet: #{@player.wallet}"

    if(@player.wallet <= 0)
      puts "No more money. Thanks for playing. Play again next time!"
      break
    end

    print "Enter 1 to leave game; any key to continue: "
    stop = gets.chomp.to_i
    end
    puts "DONE!"
  end
end
#--------- Running Script ----------
if __FILE__ == $PROGRAM_NAME #this loop is so that you don't comment it out when you run spec
  Blackjack.new.play
  # puts "Let's play blackjack!"
  # player = Person.new(100)
  # stop = 0
  #
  # while((player.wallet > 0) && (stop != 1)) do
  #   hitorstay = 0
  #   dealer_hand = Hand.new
  #   my_hand = Hand.new
  #   deck = Deck.new
  #   roundend = false
  #
  #   print "What amount would you like to bet on? "
  #   bet = gets.chomp.to_i
  #
  #   while(bet > player.wallet)
  #     print "Only bet within your budget please: "
  #     bet = gets.chomp.to_i
  #   end
  #
  #   #Five cards Charlie rule not included in this game
  #   dealer_hand.add(deck.draw)
  #   my_hand.add(deck.draw)
  #   dealer_hand.add(deck.draw)
  #   my_hand.add(deck.draw)
  #   dealer_hand.add(deck.draw) until(dealer_hand.value >= 16)
  #
  #   # ASK JAMES!!!
  #   # def printout
  #   #   puts "Dealer's hand: #{dealer_hand.to_s}"
  #   #   puts "Your hand: #{my_hand.to_s}"
  #   #   puts "Cards left in the deck: #{deck.cards.length}"
  #   # end
  #
  #   if(dealer_hand.busted?)
  #     puts "Dealer is busted!"
  #     puts "Dealer's hand: #{dealer_hand.to_s}"
  #     puts "Your hand: #{my_hand.to_s}"
  #     roundend = true
  #     player.wallet += bet
  #     #puts "Cards left in the deck: #{deck.cards.length}"
  #   elsif(dealer_hand.blackjack?)
  #     puts "BlackJack! Dealer won!"
  #     puts "Dealer's hand: #{dealer_hand.to_s}"
  #     puts "Your hand: #{my_hand.to_s}"
  #     roundend = true
  #     player.wallet -= bet
  #     #puts "Cards left in the deck: #{deck.cards.length}"
  #   elsif(my_hand.blackjack?)
  #     puts "BlackJack! You won!"
  #     puts "Dealer's hand: #{dealer_hand.to_s}"
  #     puts "Your hand: #{my_hand.to_s}"
  #     roundend = true
  #     player.wallet += bet
  #     #puts "Cards left in the deck: #{deck.cards.length}"
  #   else
  #     puts "Dealer's hand: #{dealer_hand.to_s}"
  #     puts "Your hand: #{my_hand.to_s}"
  #     while((my_hand.value <= 21) && (!roundend))
  #       #puts "Cards left in the deck: #{deck.cards.length}"
  #       print "Hit (Press 1) or Stay (Press 2): "
  #       hitorstay = gets.chomp.to_i
  #       if(hitorstay == 1)
  #         my_hand.add(deck.draw)
  #         puts "Your hand: #{my_hand.to_s}"
  #         if(my_hand.busted?)
  #           puts "Busted! You lose!"
  #           roundend = true
  #           player.wallet -= bet
  #         end
  #       elsif(hitorstay == 2)
  #         if(my_hand.value == dealer_hand.value)
  #           puts "Tie!"
  #         elsif(my_hand.value > dealer_hand.value)
  #           puts "You won!"
  #           player.wallet += bet
  #         else
  #           puts "You lose!"
  #           player.wallet -= bet
  #         end
  #         roundend = true
  #       end
  #     end
  #   end
  #
  #   puts "Your wallet: #{player.wallet}"
  #
  # if(player.wallet <= 0)
  #   puts "No more money. Thanks for playing. Play again next time!"
  #   break
  # end
  #
  # print "Enter 1 to leave game; any key to continue: "
  # stop = gets.chomp.to_i
  # end
  # puts "DONE!"
end
