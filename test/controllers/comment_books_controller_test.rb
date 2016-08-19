require 'test_helper'

class CommentBooksControllerTest < ActionController::TestCase
  setup do
    @comment_book = comment_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_book" do
    assert_difference('CommentBook.count') do
      post :create, comment_book: { book_id: @comment_book.book_id, message: @comment_book.message, user_id: @comment_book.user_id }
    end

    assert_redirected_to comment_book_path(assigns(:comment_book))
  end

  test "should show comment_book" do
    get :show, id: @comment_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_book
    assert_response :success
  end

  test "should update comment_book" do
    patch :update, id: @comment_book, comment_book: { book_id: @comment_book.book_id, message: @comment_book.message, user_id: @comment_book.user_id }
    assert_redirected_to comment_book_path(assigns(:comment_book))
  end

  test "should destroy comment_book" do
    assert_difference('CommentBook.count', -1) do
      delete :destroy, id: @comment_book
    end

    assert_redirected_to comment_books_path
  end
end
