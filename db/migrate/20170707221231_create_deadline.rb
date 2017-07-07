class CreateDeadline < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|
      t.date :date
      t.integer :user_id
      t.integer :list_id
    end
  end
end
