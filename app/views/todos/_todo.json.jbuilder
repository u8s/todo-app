json.extract! todo, :id, :title, :body, :due_date, :completed, :tags, :user_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
