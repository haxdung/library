class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    if params[:search_text]
      @books = Book.book_search(params[:search_text]).page(params[:page]).per(5)
    elsif params[:category]
      @books = Book.book_category(params[:category]).page(params[:page]).per(5)
    else
      @books = Book.all.page(params[:page]).per(5)
    end
    respond_to do |format|
      format.js
      format.html
    end
  end
end
