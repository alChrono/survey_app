require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  test "should not save survey without name" do
    survey 			= Survey.new
    survey.name 	= ""

    assert_not survey.save
  end

  test "should save survey with name" do
    survey 			= Survey.new {}
    survey.name 	= "Bruins"
    assert survey.save
  end

  test "should find survey" do
    survey 			= Survey.new {}
    survey.name 	= "Bruins"
    survey.save

    assert_not_nil Survey.find_by name: "Bruins"
  end

  test "should not find survey" do
    survey 			= Survey.new {}
    survey.name 	= "Bruins"
    survey.save

    assert_nil Survey.find_by name: "Ducks"
  end
end
