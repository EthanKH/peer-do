class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :completion
      t.integer :ping_frequency
      t.string :viewer_permissions

      t.timestamps
    end
  end
end
