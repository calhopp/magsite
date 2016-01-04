class Forum < ActiveRecord::Base
	has_many :categories
	validates :title, presence: true
	validates :description, presence: true
end
