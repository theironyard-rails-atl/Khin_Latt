# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  answer     :string(255)
#  max_misses :integer
#  misses     :integer
#  guessed    :string(255)
#  created_at :datetime
#  updated_at :datetime
#
WORDS = File.read("./words.txt").split("\n").map { |w| w.strip.downcase }

class Game < ActiveRecord::Base
  # ^ knows to look at "games" table for data
  #   and defines methods from schema

  # string can hold only 255 chars
  # else use text instead of string

  # Answer cannot be nil or ""
  validates_presence_of :answer, :max_misses, :misses
  validate :guessed_string_is_not_nil

  def available_letters
    ('a'..'z').to_a - self.guessed
  end

  def board
    # Take @answer and only show letters that the player has guessed
    result = ""
    self.answer.split("").each do |char|
      if self.guessed.include?(char)
        result += char
      else
        result += " _ "
      end
    end
    result
  end

  def guess(letter)
    letter.downcase!
    found = self.answer.include?(letter)
    unless self.guessed.include?(letter)
      self.guessed += letter
      self.misses += 1 unless found
    end
    self.save!

    found
  end

  def guessed_string_is_not_nil    # defining validate method
    if guessed.nil?
      self.errors.add :guessed, "Guessed cannot be nil"
    end
  end

  def finished?
    won? || lost?
  end

  def won?
    !board.include?("_")
  end

  def lost?
    ( self.max_misses - self.misses ).zero?
  end

  def status
    if self.won?
      "You won!"
    elsif self.lost?
      "You lost :( - the word was #{self.answer}"
    else
      "#{ self.max_misses - self.misses } / #{self.max_misses}"
    end
  end
end
