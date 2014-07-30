Questions = [
  {
    question: "Why did the chicken cross the road?",
    choices: [
      "Why does anyone do anything?",
      "To get to the other side",
      "Something something something YOUR MOM",
      "Mu"],
    answer: 1
  },
  {
    question: "Why ROR?",
    choices: [
      "It is the same as java!",
      "It's awesome!",
      "I like to create iOS apps",
      "I am into front-end"],
    answer: 2
  },
  {
    question: "1+1 = ?",
    choices: [
      "It is 4!",
      "N/A",
      "2",
      "It is calculus!"],
    answer: 3
  },
  {
    question: "Where is Atlanta?",
    choices: [
      "It is in the northeast",
      "It's in Georgia",
      "It is New York",
      "I like Atlanta"],
    answer: 2
  },
  {
    question: "Why cheese?",
    choices: [
      "It is veggie.",
      "It tastes bad",
      "It is meat",
      "It is delicious!"],
    answer: 4
  }
]


class Quiz
  attr_reader :qhash
  attr_reader :num
  attr_reader :answer

  def initialize
    @score = 0
    @qhash = Questions.shuffle
    @num = @qhash.length
    @input = 0
    @answer_array = []
  end

  def ask
    i = 0
    j = 0
    while(i < @num) do
      puts "Question #{(i+1)}: #{@qhash[i][:question]}"
      puts "Choices: "
        while(j < @qhash[i][:choices].length) do
          puts "#{(j+1)} - #{@qhash[i][:choices][j]}"
          j += 1
        end
      print "Answer: "
      @input = gets.chomp.to_i
      @answer_array << @input
      correct?(@input, i)
      i += 1
      j = 0
    end
    puts "Your score is #{@score} out of #{@num}!"
    display_results
  end

  def correct?(user_input, i)
    @score += 1 if user_input == @qhash[i][:answer].to_i
    return (user_input == @qhash[i][:answer].to_i)
  end

  def display_results
    i = 0
    puts ""
    puts "Review.........."
    while(i < @num) do
      puts "Question #{(i+1)}: #{@qhash[i][:question]}"
      puts "Correct Answer: #{@qhash[i][:answer].to_i}"
      if(correct?(@answer_array[i], i))
        puts "You answered it right!"
      else
        puts "You answered it wrong!"
      end
      i += 1
    end
  end
end
