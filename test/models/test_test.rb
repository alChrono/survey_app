require 'test_helper'

class TestTest < ActiveSupport::TestCase
  test "should not save test without survey_id" do
    test				= Test.new
    test.survey_id		= ""
    test.question_id	= "1"

    assert_not test.save
  end

  test "should not save test without question_id" do
    test				= Test.new
    test.survey_id		= "1"
    test.question_id	= ""

    assert_not test.save
  end

  test "should not save test" do
    test				= Test.new
    test.survey_id		= "1"
    test.question_id	= "2"

    assert test.save
  end

  test "should find records" do
  	# search for items not in Active Records
    assert_nil Test.find_by survey_id: "3"
    assert_nil Test.find_by question_id: "3"
  end

  test "should not find records" do
  	test				= Test.new
    test.survey_id		= "1"
    test.question_id	= "2"

    test.save

    # search for items in active record
    assert_not_nil Test.find_by survey_id: "1"
    assert_not_nil Test.find_by question_id: "2"
  end
end
