class UpdateListWithDeadline < ActiveRecord::Migration
  def change
    remove_column :lists, :due_date, :date
  end
end
