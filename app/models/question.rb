class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :responses
  has_many :choices
  belongs_to :survey

  validates :name, :survey, presence: true

  def total_responses_to_question
    self.responses.count
  end

  def highest_response
    self.choices.max_by { |choice| choice.response_amount }.name
  end
end
