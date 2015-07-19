class Question < ActiveRecord::Base
	belongs_to :survey
	has_many :choices , dependent: :destroy
	has_many :selections, dependent: :destroy
	validates :text, presence: true
	validates :question_type, presence: true

end
