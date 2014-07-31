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
    3.times{ survey.ask }
    assert_equal survey.ratings.length, 4
  end

  it "prints out user's highest, lowest and average ratings" do
    survey = Survey.new(Q)
    4.times{ survey.ask }
    assert_equal survey.ratings.max, 4
    assert_equal survey.ratings.min, 1
    assert_equal survey.average, 2.5
  end


end
