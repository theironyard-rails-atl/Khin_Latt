require "./question.rb"
require "./quiz.rb"
require "minitest/autorun"

describe "Question class " do
  def setup
    @q1 = Question.new("Why did the ...")
  end

  it "takes in the question and stores it in an instance variable " do
    assert_equal "Why did the ...", @q1.question
  end

  it "takes in choices and push it in the array" do
    @q1.add_choice("Why does anyone do anything?")
    assert_equal "Why does anyone do anything?", @q1.choices[0]
    @q1.add_choice("Why not?")
    assert_equal "Why not?", @q1.choices[1]
    assert_equal 2, @q1.choices.length
  end

  it "get the answer key" do
    @q1.add_choice("Why does anyone do anything?")
    @q1.add_choice("Why not?")
    @q1.add_answer(1)
    assert_equal 1, @q1.answer
    #assert_equal 10, @q1.add_answer(3)
  end

end

describe "Quiz class" do
  def setup
    @quiz = Quiz.new
  end

  it "" do

  end

  it "" do

  end

end
