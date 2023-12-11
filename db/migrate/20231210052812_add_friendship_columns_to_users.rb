class AddFriendshipColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :friendship_id, :integer
  end
end
