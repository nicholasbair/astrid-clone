class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :title
      t.integer :status, default => 0
      t.timestamps null: false
    end
  end
end
