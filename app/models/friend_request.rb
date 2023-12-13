# == Schema Information
#
# Table name: friend_requests
#
#  id          :integer          not null, primary key
#  status      :string           default("pending")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  receiver_id :integer          not null
#  sender_id   :integer          not null
#
# Indexes
#
#  index_friend_requests_on_receiver_id  (receiver_id)
#  index_friend_requests_on_sender_id    (sender_id)
#
# Foreign Keys
#
#  receiver_id  (receiver_id => users.id)
#  sender_id    (sender_id => users.id)
#
class FriendRequest < ApplicationRecord
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"

  enum status: { pending: "pending", accepted: "accepted", rejected: "rejected" }
  scope :accepted, -> { where(status: :accepted) }

  def accept!
    update(status: 'accepted')
  end

  def reject!
    update(status: 'rejected')
  end
end
