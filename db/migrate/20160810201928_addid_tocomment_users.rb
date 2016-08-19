class AddidTocommentUsers < ActiveRecord::Migration
  def change
  	add_column :comment_users, :user_id2, :integer
  end
end
