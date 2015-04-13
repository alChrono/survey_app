class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

protected
	def get_survey_questions(survey_id)
	    # get all the question_ids associated with the survey
	    tests     = Test.select("question_id").where(survey_id: survey_id)

	    survey_questions = Array.new

	    tests.each do |test|
	      $logger.debug {test.question_id}
	      survey_questions << test.question_id
	    end

	    # get all the questions that are associated with the survey
	    # duplicate questions are ommited
	    return Question.where("id in(?)", survey_questions).to_a
	end
end
