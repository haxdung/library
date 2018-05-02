class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:info] = "Successs"
      if current_user.Admin?
        redirect_to admin_users_url
      else
        redirect_to root_url
      end
    else
      flash[:danger] = "Fails"
      if current_user.Admin?
        redirect_to admin_users_url
      else
        redirect_to root_url
      end
    end
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    user = User.find_by id: params[:id]
    if user.update_attributes user_params
      flash[:info] = "Successs"
      redirect_to admin_users_url
    else
      Rails.logger.info(user.errors.messages.inspect)
      flash[:info] = "Fails"
      redirect_to request.referrer || root_url
    end
  end

  def destroy
    user = User.find_by id: params[:id]
    if !user.nil?
      user.destroy
      flash[:info] = "Successs"
      redirect_to request.referrer || root_url
    else
      flash[:info] = "Fails"
      redirect_to request.referrer || root_url
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :password, :password_confirmation,
                                 :role, :email
  end
end
