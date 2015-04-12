require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "should not save question without question" do
    question 			= Question.new
    question.question 	= ""
    question.answer_1 	= "yes"

    assert_not question.save
  end

  test "should not save question without one answer" do
    question 			= Question.new {}
    question.question 	= "Why?"
    question.answer_1   = ""
    assert_not question.save
  end

  test "should save question with five answers" do
    question 			= Question.new {}
    question.question 	= "Why?"
    question.answer_1   = "yes"
    question.answer_2   = "no"
    question.answer_3   = "maybe"
    question.answer_4   = "so"
    question.answer_5   = "ok"
    assert question.save
  end

  test "should find question" do
    question 			= Question.new {}
    question.question 	= "Why?"
    question.answer_1   = "yes"
    question.answer_2   = "no"
    question.answer_3   = "maybe"
    question.answer_4   = "so"
    question.answer_5   = "ok"

    question.save

    assert_not_nil Question.find_by question: "Why?"
  end

  test "should not find question" do
    question 			= Question.new {}
    question.question 	= "Why?"
    question.answer_1   = "yes"
    question.answer_2   = "no"
    question.answer_3   = "maybe"
    question.answer_4   = "so"
    question.answer_5   = "ok"

    question.save

    assert_nil Question.find_by question: "Why"
  end
end
