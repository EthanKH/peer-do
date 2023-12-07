class AddPingsCountToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :pings_count, :integer, default: 0
  end
end
