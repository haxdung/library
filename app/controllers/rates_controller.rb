class RatesController < ApplicationController
  before_action :authenticate_user!
  def create
    rate = Rate.find_or_create_by book_id: params[:book_id], user_id: current_user.id
    rate.update_attributes point: params[:point]
    render json: {
        point: rate.book.average_point
    }
  end

  def update

  end

end
