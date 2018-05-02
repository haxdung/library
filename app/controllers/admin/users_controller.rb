class Admin::UsersController < Admin::BaseController
  def new

  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find_by id: params[:id]
  end

end
