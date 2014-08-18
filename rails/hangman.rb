WORDS = File.read("./words.txt").split("\n").map { |w| w.strip.downcase }

class Hangman
  def initialize
    @answer = WORDS.sample
    @misses_remaining = 6
    @guessed = []
  end

  def available_letters
    ('a'..'z').to_a - @guessed
  end

  def board
    # Take @answer and only show letters that the player has guessed
    result = ""
    @answer.split("").each do |char|
      if @guessed.include?(char)
        result += char
      else
        result += "_"
      end
    end
    result
  end

  def guess(letter)
    letter.downcase!
    found = @answer.include?(letter)

    unless @guessed.include?(letter)
      @guessed << letter
      @misses_remaining -= 1 unless found
    end

    found
  end

  def finished?
    won? || lost?
  end

  def won?
    !board.include?("_")
  end

  def lost?
    @misses_remaining.zero?
  end

  def status
    if self.won?
      "You won!"
    elsif self.lost?
      "You lost :( - the word was #{@answer}"
    else
      "#{@misses_remaining} / 6"
    end
  end
end
