class CategoriesController < ApplicationController
  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Successs"
      redirect_to admin_categories_url
    else
      flash[:danger] = "Fails"
      redirect_to request.referrer || root_url
    end
  end

  def update
    category = Category.find_by id: params[:id]
    if category.update_attributes category_params
      flash[:info] = "Successs"
      redirect_to admin_categories_url
    else
      flash[:info] = "Fails"
      redirect_to request.referrer || root_url
    end
  end

  def destroy
    category = Category.find_by id: params[:id]
    if !category.nil?
      category.destroy
      flash[:info] = "Successs"
      redirect_to request.referrer || root_url
    else
      flash[:info] = "Fails"
      redirect_to request.referrer || root_url
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
