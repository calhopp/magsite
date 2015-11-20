class CreateCatergories < ActiveRecord::Migration
  def change
    create_table :catergories do |t|
      t.belongs_to :forums, index: true
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
