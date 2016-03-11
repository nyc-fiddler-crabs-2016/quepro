class User < ActiveRecord::Base
  has_secure_password
  include BCrypt

  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: true

end
