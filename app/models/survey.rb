class Survey < ActiveRecord::Base
	has_many :questions
	has_many :completions
	belongs_to :user
end
