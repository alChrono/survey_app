class Question < ActiveRecord::Base
	has_many 	:tests, dependent: :destroy
	has_many 	:surveys, 	:through => :tests
	validates 	:question, 	:presence => true
	validates 	:answer_1, 	:presence => true
	validates_uniqueness_of :question,  :scope => [:answer_1, :answer_2, :answer_3, :answer_4, :answer_5]
end
