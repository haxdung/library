class BooksController < ApplicationController

  def show
    @book = Book.find_by id: params[:id]
  end
  def create
    @book = Book.new book_params
    if @book.save
      flash[:info] = "Successs"
      redirect_to admin_books_url
    else
      flash[:info] = "Fails"
      redirect_to request.referrer || root_url
    end
  end

  def update
    book = Book.find_by id: params[:id]
    if book.update_attributes book_params
      flash[:info] = "Successs"
      redirect_to admin_books_url
    else
      flash[:info] = "Fails"
      redirect_to request.referrer || root_url
    end
  end

  def destroy
    book = Book.find_by id: params[:id]
    book.destroy
  end

  private
  def book_params
    params.require(:book).permit :name, :description, :category_id, :author_id, :image
  end
end
