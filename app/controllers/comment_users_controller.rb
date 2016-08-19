class CommentUsersController < ApplicationController
  before_action :set_comment_user, only: [:show, :edit, :update, :destroy]

  # GET /comment_users
  # GET /comment_users.json
  def index
    @comment_users = CommentUser.all
  end

  # GET /comment_users/1
  # GET /comment_users/1.json
  def show
  end

  # GET /comment_users/new
  def new
    @comment_user = CommentUser.new
  end

  # GET /comment_users/1/edit
  def edit
    
    @user = @comment_user.user
  end

  # POST /comment_users
  # POST /comment_users.json
  def create
    @comment_user = CommentUser.new(comment_user_params)
    @comment_user.user_id2 = current_user.id

    respond_to do |format|
      if @comment_user.save
        format.html { redirect_to profile_path(id: @comment_user.user_id), notice: 'Comment user was successfully created.' }
        format.json { render :show, status: :created, location: @comment_user }
      else
        format.html { render :new }
        format.json { render json: @comment_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_users/1
  # PATCH/PUT /comment_users/1.json
  def update
    respond_to do |format|
      if @comment_user.update(comment_user_params)
        format.html { redirect_to @comment_user, notice: 'Comment user was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_user }
      else
        format.html { render :edit }
        format.json { render json: @comment_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_users/1
  # DELETE /comment_users/1.json
  def destroy
   
    @comment_user.destroy
    respond_to do |format|
      format.html { redirect_to comment_users_url,  notice: 'Comment user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_user
      @comment_user = CommentUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_user_params
      params.require(:comment_user).permit(:message, :user_id , :user_id2)
    end
end

