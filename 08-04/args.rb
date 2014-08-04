def display_name(last, first, middle=nil) # middle name is optional
  if middle
    "#{first} #{middle} #{last}"
  else
    "#{first} #{last}"
  end
end

def sum(*numbers)
  puts "numbers is #{nubmers} (a #{numbers.class})"
  # total = 0
  # numbers.each do |number|
  #   total += number
  # end
  # total

  # could also do
  total = numbers.reduce { |sum, number| sum + number} #will grab first two elements add and put back; it doesn't change numbers
  # same as inject
  # or numbers.reduce(&:+) <- to_proc
  # or numbers.reduce(:+)
end

class Card
  RANK = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
  SUITS = [:diamonds, :spades, :clubs, :hearts]

  def initialize(rank=nil, suit=nil)
    if rank
      @rank = rank
    else
      @rank = RANKS.sample
    end

    @suit = suit || SUITS.sample # or gives back SUITS.sample if first argument is nil
  end
end

class KeywordCard
  def initialize hash={}
    @rank = hash[:rank] || RANKS.sample
    @suit = hash[:suit] || SUITS.sample
  end
end

#better and newer way below
class KeywordCard
  def initialize rank: nil, suit: nil
    @rank = rank || Card::RANKS.sample
    @suit = suit || Card::SUITS.sample
  end
end
