class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :choice
  belongs_to :question

  validates :user, :choice, :question, presence: true
end
