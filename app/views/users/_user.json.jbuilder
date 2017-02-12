json.extract! user, :id, :email, :password, :username, :department_id, :position, :isGeneralAdmin, :isDepartmentAdmin, :created_at, :updated_at
json.url user_url(user, format: :json)