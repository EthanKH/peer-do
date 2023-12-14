# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :text             default(""), not null
#  encrypted_password     :string           default(""), not null
#  og_name                :string
#  pings_count            :integer          default(0)
#  private                :boolean          default(TRUE)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tasks_count            :integer          default(0)
#  username               :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  friendship_id          :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, class_name: "Task", foreign_key: "owner_id"
  self.table_name = "users"

  has_many :own_tasks, foreign_key: :owner_id, class_name: "Task"
  has_many :pings, foreign_key: :poker_id

  has_many :sent_friend_requests, foreign_key: :sender_id, class_name: "FriendRequest"
  has_many :accepted_sent_friend_requests, -> { accepted }, foreign_key: :sender_id, class_name: "FriendRequest"

  has_many :received_friend_requests, foreign_key: :receiver_id, class_name: "FriendRequest"
  has_many :accepted_received_friend_requests, -> { accepted }, foreign_key: :receiver_id, class_name: "FriendRequest"

  has_many :receivers, through: :accepted_sent_friend_requests, source: :receiver
  has_many :senders, through: :accepted_received_friend_requests, source: :sender

  has_many :friends, through: :accepted_sent_friend_requests, source: :receiver

  has_many :peer_tasks, through: :pings, source: :task
  has_many :tasks_page, through: :receivers, source: :own_tasks
  
  before_validation :generate_username, on: :create
  def generate_username
    self.username = email.split('@').first
    self.og_name = self.username.capitalize
  end

  def generated_name
    read_attribute(:generated_name) || username
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id email username created_at updated_at] 
    # List the attributes you want to allow for searching
  end

  # validates :username, presence: true, uniqueness: true
end
