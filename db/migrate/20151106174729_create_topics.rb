class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.belongs_to :category, index: true

      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
