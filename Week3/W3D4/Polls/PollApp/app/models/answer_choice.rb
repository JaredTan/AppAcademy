class AnswerChoice < ApplicationRecord
  validates :question_id, :a_text, presence: true

  has_many :responses,
  primary_key: :id,
  foreign_key: :answer_id,
  class_name: :Response

  belongs_to :question,
  primary_key: :id,
  foreign_key: :question_id,
  class_name: :Question

end
