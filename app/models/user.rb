class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email must be valid" }
  validates :first, :last, :email, :password, :password_confirmation, presence: true
  validates :password, :password_confirmation, length: { minimum: 8, message: "Password must be at least 8 characters" }
  
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
