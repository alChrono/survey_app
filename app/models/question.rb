class Question < ActiveRecord::Base
	has_and_belongs_to_many :surveys
	validates :question, length: {maximum: 1000},	presence: true
	validates :answer_1, length: {maximum: 1000},	presence: true
	validates :answer_2, length: {maximum: 1000},	presence: true
	validates :answer_3, length: {maximum: 1000},	presence: true
	validates :answer_4, length: {maximum: 1000},	presence: true
	validates :answer_5, length: {maximum: 1000},	presence: true
end
