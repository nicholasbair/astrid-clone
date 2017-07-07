class AddDueDateToList < ActiveRecord::Migration
  def change
    add_column :lists, :due_date, :date
  end
end
