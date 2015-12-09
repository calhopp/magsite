class Category < ActiveRecord::Base
	belongs_to :forum
	has_many :topics
	validates :title, presence: true
	validates :description, presence: true
end
