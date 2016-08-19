class CreateCommentUsers < ActiveRecord::Migration
  def change
    create_table :comment_users do |t|
      t.string :message
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
