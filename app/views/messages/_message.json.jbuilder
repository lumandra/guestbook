json.extract! message, :id, :name, :email, :message, :state, :created_at, :updated_at
json.url message_url(message, format: :json)
