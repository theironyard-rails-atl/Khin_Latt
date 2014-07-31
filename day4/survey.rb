class Survey
  attr_reader :list

  def initialize(list)
    @list = list
    @ratings = []
  end

  def print_survey

  end
end


#---------- Running Script ----------
Questionnaires = ["Rate Chipotle: ", "Rate Starbucks: ",
  "Rate Atlanta: ", "Rate your happiness: "]
