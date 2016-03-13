class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :questions

  validates :title, :user, presence: true

  def total_responses_to_survey
      self.questions.map { |q| q.total_responses_to_question}.reduce(:+)
  end
end
