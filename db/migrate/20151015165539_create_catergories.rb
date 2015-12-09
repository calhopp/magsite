class CreateCatergories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.belongs_to :forum, index: true
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
