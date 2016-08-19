class CreateCommentBooks < ActiveRecord::Migration
  def change
    create_table :comment_books do |t|
      t.string :message
      t.integer :user_id
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
