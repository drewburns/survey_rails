class Completion < ActiveRecord::Base
	belongs_to :user
	has_many :selections
	belongs_to :survey
end
