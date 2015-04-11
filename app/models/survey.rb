class Survey < ActiveRecord::Base
	has_many 	:tests, dependent: :destroy
	has_many 	:surveys, 	:through => :tests
	validates :name, :presence => true, :uniqueness => true
end
