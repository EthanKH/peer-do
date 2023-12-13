class ChangeCompletionToBooleanInTasks < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :completion, :boolean, default: false
  end
end
