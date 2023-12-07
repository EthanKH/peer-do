class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :description
      t.date :due_date
      t.time :due_time
      t.integer :completion
      t.integer :ping_frequency
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
