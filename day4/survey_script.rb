require "minitest/autorun"
require "./survey.rb"

describe "The Survey" do

  it "takes a list of statement" do
    survey = Survey.new(Questionnaires)
    puts survey.list
  end

  it "scale should be from 1 - 5"

  it "should store ratings in proper array"

  it "ask the user to rate"

  it "check after survey is over"

  it "prints out user's highest, lowest and average ratings"


end
