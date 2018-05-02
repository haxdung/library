class Rate < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :user, optional: true
  after_update :update_avg_book

  private
  def update_avg_book
    new_avg_point = book.rates.map{|v| v.point}.reduce(:+) / book.rates.count
    book.update_attributes average_point: new_avg_point
  end
end
