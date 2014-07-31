require "minitest/autorun"
require "./survey.rb"

describe "The Survey" do

  it "takes a list of statement" do
    survey = Survey.new(Q)
    assert_equal survey.list.length, 4
  end

  it "doesn't stop until the whole survey is over" do
    survey = Survey.new(Q)
    assert_equal survey.finished?, false
    survey.ask
    assert_equal survey.num_asked, 1
  end

  it "should populate ratings array" do
    survey = Survey.new(Q)
    assert_equal survey.ratings.length, 0
    survey.ask
    assert_equal survey.ratings.length, 1
  end

  it "should store ratings in proper array"

  it "ask the user to rate"

  it "check after survey is over"

  it "prints out user's highest, lowest and average ratings"


end
