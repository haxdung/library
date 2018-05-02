class Book < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: :User, foreign_key: :author_id, optional: true
  has_many :likes, dependent: :delete_all
  has_many :users_liked, through: :likes
  has_many :rates, dependent: :delete_all
  has_many :user_rateds, through: :rates
  mount_uploader :image, ImageUploader

  scope :book_category, -> category_id { where(category_id: category_id )}
  scope :book_search, -> text {where("name LIKE ?", "%#{text}%")}
end
