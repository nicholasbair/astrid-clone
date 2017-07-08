class ChangeDeadlineToUseDatetime < ActiveRecord::Migration
  def change
    remove_column :deadlines, :date, :date
    add_column :deadlines, :time, :datetime
  end
end
