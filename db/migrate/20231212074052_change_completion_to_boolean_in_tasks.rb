class ChangeCompletionToBooleanInTasks < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up { change_column :tasks, :completion, :boolean }
      dir.down { change_column :tasks, :completion, :integer }
    end
  end
end
