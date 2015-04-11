class Survey < ActiveRecord::Base
	has_and_belongs_to_many :questions
	validates :name, 			length:	{maximum: 40}, 		presence: true
	validates :question_list,	length:	{maximum: 1000},	presence: true
end
