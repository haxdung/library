class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_locale

  def authenticate_user!
    return if logged_in?
    store_location
    flash[:warning] = "You must sign in"
    if request.xhr?
      respond_to do |format|
        format.js { render inline: "window.location.href = '#{login_url}'" }
      end
    else
      redirect_to login_url
    end
  end

  def authenticate_admin!
    return if current_user.Admin?
    flash[:warning] = "Only for admin"
    redirect_to root_url
  end


  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
