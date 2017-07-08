class ChangeUserTimezone < ActiveRecord::Migration
  def change
    rename_column :users, :timezone, :time_zone
  end
end
