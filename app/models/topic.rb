class Topic < ActiveRecord::Base
	belongs_to :catergory
	has_many :posts
	validates :title, presence: true
	validates :description, presence: true
end
