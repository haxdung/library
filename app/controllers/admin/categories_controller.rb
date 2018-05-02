class Admin::CategoriesController < Admin::BaseController

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find_by id: params[:id]
  end

  def index
    @categories = Category.all
  end

end
