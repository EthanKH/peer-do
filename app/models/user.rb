# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :text             default(""), not null
#  encrypted_password     :string           default(""), not null
#  pings_count            :integer          default(0)
#  private                :boolean
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tasks_count            :integer          default(0)
#  username               :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :tasks, class_name: "Task", foreign_key: "owner_id"
  has_many :tasks, foreign_key: :owner_id, class_name: "Task"
  has_many :pings, foreign_key: :poker_id

  has_many :sent_friend_requests, foreign_key: :sender_id, class_name: "FriendRequest"
  has_many :received_friend_requests, foreign_key: :receiver_id, class_name: "FriendRequest"
end
