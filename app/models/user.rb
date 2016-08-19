class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

   mount_uploader :profile_picture, ProfileUploader

   has_many :books
   has_many :reviews, :class_name => 'CommentUser', :foreign_key => 'user_id'
   has_many :comments, :class_name => 'CommentUser', :foreign_key => 'user_id2'

   devise :omniauthable, :omniauth_providers => [:facebook]
   
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.profile_picture = auth.info.profile_picture # assuming the user model has an image
    end
  end
        def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
       
        acts_as_votable

  def score
  self.get_upvotes.size - self.get_downvotes.size
  end

end
