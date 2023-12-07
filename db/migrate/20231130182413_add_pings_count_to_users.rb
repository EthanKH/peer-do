class AddPingsCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pings_count, :integer, default: 0
  end
end
