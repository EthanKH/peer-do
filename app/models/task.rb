# == Schema Information
#
# Table name: tasks
#
#  id             :integer          not null, primary key
#  completion     :integer
#  description    :text
#  due_date       :date
#  due_time       :time
#  ping_frequency :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer          not null
#
# Indexes
#
#  index_tasks_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  owner_id  (owner_id => users.id)
#
class Task < ApplicationRecord
  belongs_to :owner, class_name: "User"
end
