class User < ActiveRecord::Base
  has_secure_password
  include BCrypt

  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :surveys
  has_many :surveys_takens
  has_many :responses

end
