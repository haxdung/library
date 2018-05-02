class Admin::BooksController < Admin::BaseController
  def new
    @book = Book.new
    @categories = Category.all
    @authors = User.authors
  end

  def edit
    @book = Book.find_by id: params[:id]
    @categories = Category.all
    @authors = User.authors
  end

  def index
    @books = Book.all
  end
end
