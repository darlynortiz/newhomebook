class UsersController < ApplicationController

def profile 
@user=User.find(params[:id])
@comment_user = CommentUser.new
@comment_users = @user.reviews
end


def usuarios 
@user = User.all
end

def upvote
  @user = User.find(params[:id])
  @user.upvote_by current_user
  redirect_to usuarios_path
end

def downvote
  @user = User.find(params[:id])
  @user.downvote_by current_user
  redirect_to usuarios_path
end
end
