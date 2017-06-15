class Response < ApplicationRecord
  validates :user_id, :answer_id, presence: true
  validate :not_duplicate_response

  belongs_to :answer_choice,
  primary_key: :id,
  foreign_key: :answer_id,
  class_name: :AnswerChoice

  belongs_to :respondent,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not("user_id = ?", self.id)
  end

  def respondent_already_answered?
    !sibling_responses.empty?
  end

  private

  def not_duplicate_response
    if respondent_already_answered?
      errors[:response] << "can't be duplicate response."
    end
  end



end
