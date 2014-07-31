#---------- Setting Questionnaires ----------
Q = ["Rate Chipotle: ", "Rate Starbucks: ",
  "Rate Atlanta: ", "Rate your happiness: ", "Good? "]
puts "---Please rate each questionnaire on a scale of 1-5---"

#---------- Class ----------
class Survey
  attr_reader :list
  attr_reader :ratings
  attr_reader :num_asked

  def initialize(list)
    @list = list
    @ratings = []
    @num_asked = 0
  end

  def ask
      print list[@num_asked]
      @num_asked += 1
      let_user_rate
  end

  def let_user_rate
    @ratings << gets.chomp.to_i
  end

  def finished?
    @num_asked == list.length
  end

  def average
    sum = 0.0
    @ratings.each {|a| sum += a}
    return (sum / @ratings.length.to_f)
  end

  def print_survey
    puts "Max rating is #{@ratings.max},"
    puts "Min rating is #{@ratings.min} and"
    puts "Average rating is #{average}."
  end
end

#---------- Running Script ----------
survey = Survey.new(Q)
Q.each do
  survey.ask
end
puts "Survey is done; here are the results: "
survey.print_survey
