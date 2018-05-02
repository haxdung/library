module ApplicationHelper
  def liked book_id
    return logged_in? && Like.where({book_id: book_id, user_id: current_user.id}).present?
  end

  def rated book_id
    return logged_in? && Rate.where({book_id: book_id, user_id: current_user.id}).present?
  end
end
