class Selection < ActiveRecord::Base
	belongs_to :completion
	belongs_to :choice
	belongs_to :question
end
