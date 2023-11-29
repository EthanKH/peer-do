json.extract! task, :id, :description, :due_date, :due_time, :completion, :ping_frequency, :owner_id, :created_at, :updated_at
json.url task_url(task, format: :json)
