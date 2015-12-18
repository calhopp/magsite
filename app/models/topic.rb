class Topic < ActiveRecord::Base
	belongs_to :category
	has_many :posts
	validates :title, presence: true
	validates :description, presence: true
end
