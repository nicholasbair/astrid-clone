class RemoveUserFromDeadline < ActiveRecord::Migration
  def change
    remove_column :deadlines, :user_id, :integer
  end
end
