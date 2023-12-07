class CreatePings < ActiveRecord::Migration[7.0]
  def change
    create_table :pings do |t|
      t.references :poker, null: false, foreign_key: { to_table: :users }
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
