class Survey < ActiveRecord::Base
	has_many :questions, dependent: :destroy
	has_many :completions, dependent: :destroy
	belongs_to :user
	validates :title, presence: true
	validates :description, presence: true
	validates :title, uniqueness: true
end
