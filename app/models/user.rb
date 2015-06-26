class User < ActiveRecord::Base
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  enum role: %w(reader admin super_admin)

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
