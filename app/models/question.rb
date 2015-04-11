class Question < ActiveRecord::Base
	validates :question, :presence => true
	validates :answer_1, :presence => true
	#@validates :answer_2
	#validates :answer_3
	#validates :answer_4
	#validates :answer_5
end
