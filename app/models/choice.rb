class Choice < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  has_many :responses

  validates :name, :question, presence: true

  def my_question
    self.question.id
  end

  def response_amount
    self.responses.count
  end
end

