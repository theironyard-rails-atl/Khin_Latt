class Question
  attr_reader :question, :choices, :answer

  def initialize question
    @question = question
    @choices = []
    @answer
  end

  def add_choice(choice)
    @choices << choice
  end

  def add_answer(key)
    if(key <= @choices.length)
      @answer = key
    else
      puts "Invalid answer! Only #{@choices.length} choices exists."
    end
  end

  def printout
    puts "Your Question: #{@question}."
    puts "Choices are #{@choices}."
    puts "Answer: #{@answer}"
  end
end
