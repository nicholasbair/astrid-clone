class AddReminderIntervalToDeadline < ActiveRecord::Migration
  def change
    add_column :deadlines, :reminder_interval, :integer
  end
end
