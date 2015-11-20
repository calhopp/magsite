class RemoveBelongstoFromTopics < ActiveRecord::Migration
  def change
  	remove_column :topics, :forums_id
  end
end
