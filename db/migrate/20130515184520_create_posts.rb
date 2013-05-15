class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :group_id
      t.datetime :date

      t.timestamps
    end
  end
end