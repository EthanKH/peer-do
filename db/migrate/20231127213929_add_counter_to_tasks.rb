class AddCounterToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :counter, :integer
  end
end
