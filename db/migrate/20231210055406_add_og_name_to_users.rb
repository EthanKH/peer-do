class AddOgNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :og_name, :string
  end
end
