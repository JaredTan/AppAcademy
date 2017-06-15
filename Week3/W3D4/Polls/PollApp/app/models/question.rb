class Question < ApplicationRecord
  validates :poll_id, :q_text, presence: true

  has_many :answer_choices,
  primary_key: :id,
  foreign_key: :question_id,
  class_name: :AnswerChoice

  belongs_to :poll,
  primary_key: :id,
  foreign_key: :poll_id,
  class_name: :Poll

  has_many :responses,
  through: :answer_choices,
  source: :responses

  def slow_results
    answers = answer_choices
    hash = Hash.new(0)
    answers.each do |answer|
      hash[answer] = answer.responses.length
    end
    hash
  end

  def fast_results
    answers = self.answer_choices.includes(:responses)
    hash = Hash.new(0)
    answers.each do |answer|
      hash[answer] = answer.responses.length
    end
    hash
  end

  def client_stuff_SQL
    <<-SQL
      SELECT
        answer_choices.*, COUNT(*)
      FROM
        answer_choices
      LEFT OUTER JOIN
        responses ON answer_choices.id = responses.answer_id
      GROUP BY
        id
    SQL
  end

  def client_stuff
    self.answer_choices
      .select(:answer_choices, "COUNT(*) AS total")
      .joins("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_id")
      .group(:id)

  end



end
