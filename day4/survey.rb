#---------- Running Script ----------
Q = ["Rate Chipotle: ", "Rate Starbucks: ",
  "Rate Atlanta: ", "Rate your happiness: "]
puts "---Please rate each questionnaire on a scale of 1-5---"
# survey = Survey.new(Q)
# Q.each do
#   survey.ask
# end
#



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
    puts "#{@ratings} - #{@ratings.length}"
  end

  def finished?
    @num_asked == list.length
  end

  def print_survey

  end
end
