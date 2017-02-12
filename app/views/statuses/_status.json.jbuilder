json.extract! status, :id, :description, :department_id, :created_at, :updated_at
json.url status_url(status, format: :json)