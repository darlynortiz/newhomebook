class Book < ActiveRecord::Base
  
 mount_uploader :picture, ProfileUploader

	belongs_to :user
	has_many :comment_books

end
