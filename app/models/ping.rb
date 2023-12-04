# == Schema Information
#
# Table name: pings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poker_id   :integer          not null
#  task_id    :integer          not null
#
# Indexes
#
#  index_pings_on_poker_id  (poker_id)
#  index_pings_on_task_id   (task_id)
#
# Foreign Keys
#
#  poker_id  (poker_id => users.id)
#  task_id   (task_id => tasks.id)
#
class Ping < ApplicationRecord
  has_many :peers, through: :pings, source: :poker
  

  belongs_to :poker, class_name: "User", counter_cache: true
  belongs_to :task, counter_cache: true
end
