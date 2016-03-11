class Thing < ActiveRecord::Base
  # Remember to create a migration!

  # validates :user, presence: true

  belongs_to :user

end
