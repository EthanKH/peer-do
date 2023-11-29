# == Schema Information
#
# Table name: tasks
#
#  id                 :integer          not null, primary key
#  completion         :integer
#  description        :string
#  name               :string
#  ping_frequency     :integer
#  viewer_permissions :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Task < ApplicationRecord
end
