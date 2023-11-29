class Ping < ApplicationRecord
  belongs_to :poker, class_name: "User"
  belongs_to :task
end
