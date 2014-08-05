require "./question.rb"
require "highline/import"

class Quiz

  def initialize(*args)
    @questions = []
    args.each do |x|
      @questions << x
    end
    @num = @questions.length
    @answer_array = []
    @score = 0
    ask
  end

  def ask
    i = 0
    j = 0
    letters = ('A'..'Z').to_a
    while(i < @num) do
      puts "Question #{(i+1)}: #{@questions[i].question}"
      puts "Choices: "
      while(j < @questions[i].choices.length) do
        puts "#{(j+1)} or #{letters[j]} - #{@questions[i].choices[j]}"
        j += 1
      end

      #input = ask_for_answer

      # ask("Answer: ") do |question|
      #     question.in = 1..4
      # end
      print "Answer: "
      input = gets.chomp.to_i
      # input = ask_for_answer #call it
      @answer_array << input
      correct?(input, i)
      i += 1
      j = 0
    end
    puts "Your score is #{@score} out of #{@num}!"
    display_results
  end

  # use this to handle 1-4, a-d
  # def ask_for_answer
  #   ask("Answer: ", Integer) do |question|
  #      question.in = 1..4
  #   end
  # end

  def correct?(user_input, i)
    @score += 1 if((user_input == @questions[i].answer.to_i))
    return (user_input == @questions[i].answer.to_i)
  end

  def display_results
    i = 0
    puts ""
    puts "Review.........."
    while(i < @num) do
      puts "Question #{(i+1)}: #{@questions[i].question}"
      puts "Correct Answer: #{@questions[i].answer.to_i}"
      if(correct?(@answer_array[i], i))
        puts "You answered it right!"
      else
        puts "You answered it wrong!"
      end
      i += 1
    end
  end


end

#---------- Script ----------
if __FILE__ == $PROGRAM_NAME
  q1 = Question.new("Why did the chicken cross the road?")
  q1.add_choice("Why does anyone do anything?")
  q1.add_choice("To get to the other side.")
  q1.add_choice("Something something something YOUR MOM")
  q1.add_choice("What!!!")
  q1.add_answer(1)
  q2 = Question.new("1+1 = ?")
  q2.add_choice("It is 4!")
  q2.add_choice("N/A")
  q2.add_choice("2")
  q2.add_answer(3)
  quiz = Quiz.new(q1, q2)
end
