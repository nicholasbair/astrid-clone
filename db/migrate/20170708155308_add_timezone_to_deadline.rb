class AddTimezoneToDeadline < ActiveRecord::Migration
  def change
    add_column :deadlines, :time_zone, :string
  end
end
