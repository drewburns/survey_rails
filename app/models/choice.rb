class Choice < ActiveRecord::Base
	belongs_to :question
	has_many :selections , dependent: :destroy
	validates :text, presence: true

end
