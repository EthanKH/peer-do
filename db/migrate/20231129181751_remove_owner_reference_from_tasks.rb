class RemoveOwnerReferenceFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tasks, :owner, null: false, foreign_key: true
  end
end
