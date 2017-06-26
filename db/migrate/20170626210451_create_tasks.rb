class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :list_id
      t.integer :status, default => 0
      t.string :content
      t.timestamps null: false
    end
  end
end
