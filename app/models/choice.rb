class Choice < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  has_many :responses

  validates :name, :question, presence: true
end
