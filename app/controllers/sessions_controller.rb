class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    user = User.find_by email: params[:session][:email]
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      if user.Admin?
        flash[:success] = "Welcome admin"
        redirect_to admin_home_url
      else
        flash[:success] = "Welcome"
        redirect_back_or root_url
      end
    else
      flash[:danger] = "Invalid account"
      redirect_to request.referrer || root_url
    end
  end

  def destroy
    log_out
    flash[:danger] = "Logged out"
    redirect_to root_url
    # respond_to do |format|
    #   format.js { render inline: "location.reload()" }
    # end
  end
end
