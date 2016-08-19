json.extract! comment_user, :id, :message, :user_id, :created_at, :updated_at
json.url comment_user_url(comment_user, format: :json)