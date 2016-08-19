json.extract! comment_book, :id, :message, :user_id, :book_id, :created_at, :updated_at
json.url comment_book_url(comment_book, format: :json)