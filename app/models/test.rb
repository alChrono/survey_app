class Test < ActiveRecord::Base
	belongs_to :survey
	belongs_to :question
	validates :survey_id, :presence => true#, :numericality => { :greater_than => 0}
	validates :question_id, :presence => true#, :numericality => { :greater_than => 0}

	validates_uniqueness_of :survey_id, :scope => :question_id
end
