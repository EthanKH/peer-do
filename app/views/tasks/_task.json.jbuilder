json.extract! task, :id, :name, :description, :completion, :ping_frequency, :viewer_permissions, :created_at, :updated_at
json.url task_url(task, format: :json)
