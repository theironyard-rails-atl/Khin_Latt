class GuessingGame
  attr_reader :tries_left # attr_writer, attr_accessor
  def initialize(answer=nil)
    @answer = if answer
      answer
    else
      (0..100).to_a.sample
    end
    #Alternatively,
    #@answer = answer || (0..100).to_a.sample

    #Or
    #@answer = answer
    #@answer ||= (0.100).to_a.sample

    @tries_left = 5
    @won = false
  end

  def guess(number)
    @tries_left -= 1

    if(number == @answer)
      @won = true
    elsif(number < @answer)
      "Your guess is too low"
    else
      "Your guess is too high"
    end
  end

  def finished?
    @tries_left.zero? || @won
  end

  def won?
    @won
  end

  # def tries_left
  #   @tries_left
  # end Alternatively, we are using attr_reader

end
