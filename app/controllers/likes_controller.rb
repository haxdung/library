class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @book = Book.find_by id: params[:book_id]
    current_user.likes.create(book_id: params[:book_id])
  end

  def destroy
    @book = Book.find_by id: params[:id]
    like = Like.find_by book_id: params[:id]
    like.destroy
  end

end
