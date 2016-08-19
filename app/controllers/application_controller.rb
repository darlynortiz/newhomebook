class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	  before_action :configure_permitted_parameters, if: :devise_controller?

	  protected

	  def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :address, :profile_picture])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :address, :profile_picture])
	  end

	  def profile 
		@user=User.find(params[:id])
		@comment_user = CommentUser.new
		@comment_users= CommentUser.all
	  end
 
before_action :set_locale

 def set_locale
     I18n.locale = params[:lang] || I18n.default_locale
 end



end
