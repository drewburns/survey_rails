class Completion < ActiveRecord::Base
	belongs_to :user
	has_many :selections, dependent: :destroy
	belongs_to :survey
end
