class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email
  has_secure_password
  validates :name ,presence: true, length: {maximum: 30}
  validates :password, presence: true, length: {minimum: 8}, on: :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, presence: true, on: :create
  enum role: {User: 0, Author: 1, Admin: 2}
  has_many  :books, dependent: :delete_all, foreign_key: :author_id
  has_many  :likes, dependent: :delete_all
  has_many  :books_liked, through: :likes
  has_many  :rates, dependent: :delete_all
  has_many  :books_rated, through: :rates

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end

  end

  def remember
    self.remember_token = User.new_token
    update_attributes(remember_digest: User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attributes remember_digest: nil
  end


  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest:  User.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  scope :authors, -> {where role: 1}

  private

  def downcase_email
    return unless email
    self.email = email.downcase
  end

end
