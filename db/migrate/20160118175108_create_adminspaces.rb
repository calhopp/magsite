class CreateAdminspaces < ActiveRecord::Migration
  def change
    create_table :adminspaces do |t|

      t.timestamps null: false
    end
  end
end
