class RenameRecipientToReceiverInFriendRequests < ActiveRecord::Migration[7.0]
  def change
    rename_column :friend_requests, :recipient_id, :receiver_id
  end
end
