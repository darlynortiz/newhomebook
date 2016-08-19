class CommentBooksController < ApplicationController
  before_action :set_comment_book, only: [:show, :edit, :update, :destroy]

  # GET /comment_books
  # GET /comment_books.json
  def index
    @comment_books = CommentBook.all
  end

  # GET /comment_books/1
  # GET /comment_books/1.json
  def show
  end

  # GET /comment_books/new
  def new
    @comment_book = CommentBook.new
  end

  # GET /comment_books/1/edit
  def edit
    @book = @comment_book.book
    
  end

  # POST /comment_books
  # POST /comment_books.json
  def create
    @comment_book = CommentBook.new(comment_book_params)
    @comment_book.user_id = current_user.id
    respond_to do |format|
      if @comment_book.save
        format.html { redirect_to @comment_book, notice: 'Comment book was successfully created.' }
        format.json { render :show, status: :created, location: @comment_book }
      else
        format.html { render :new }
        format.json { render json: @comment_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_books/1
  # PATCH/PUT /comment_books/1.json
  def update
    respond_to do |format|
      if @comment_book.update(comment_book_params)
        format.html { redirect_to @comment_book, notice: 'Comment book was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_book }
      else
        format.html { render :edit }
        format.json { render json: @comment_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_books/1
  # DELETE /comment_books/1.json
  def destroy
    @comment_book.destroy
    respond_to do |format|
      format.html { redirect_to comment_books_url, notice: 'Comment book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_book
      @comment_book = CommentBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_book_params
      params.require(:comment_book).permit(:message, :user_id, :book_id)
    end
end
