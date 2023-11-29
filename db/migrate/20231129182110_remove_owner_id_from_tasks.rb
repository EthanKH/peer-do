class RemoveOwnerIdFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :owner_id
  end
end
