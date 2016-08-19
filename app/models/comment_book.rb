class CommentBook < ActiveRecord::Base

	belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
	belongs_to :user_review, :class_name => 'User', :foreign_key => 'user_id2'
	belongs_to :book
end
