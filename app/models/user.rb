class User < ActiveRecord::Base

  include BCrypt

  validates :user_name, length: {maximum: 20}, presence: true, uniqueness: true
  validates :password_hash, presence: true

  has_many :things


     def password
      @password ||= Password.new(password_hash) # reading encrypted password and turning it into BCrypt Password object
    end

    def password=(new_password) # plain text password incoming here
      @password = Password.create(new_password) # plain text password encrypted here
      self.password_hash = @password # password_hash column/attribute set to encrypted password here
    end
end
