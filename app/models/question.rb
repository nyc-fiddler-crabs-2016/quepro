class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :responses
  has_many :choices
  belongs_to :survey

  validates :name, :survey, presence: true
end
