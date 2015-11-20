class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.belongs_to :topics
    	t.belongs_to :users
      t.string :content

      t.timestamps null: false
    end
  end
end
