class Post < ActiveRecord::Base
	def initialize(topic_id)
		self.topic_id = 1
	end
	belongs_to :user
	belongs_to :topic
	default_scope -> { order(created_at: :asc)}
end
