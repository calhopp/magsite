class Forum < ActiveRecord::Base
	has_many :catergories
	validates :title, presence: true
	validates :description, presence: true
end
