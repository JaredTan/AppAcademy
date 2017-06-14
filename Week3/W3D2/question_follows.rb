require_relative 'users'
require_relative 'questions'
require_relative 'questions_database'

class QuestionFollow
  attr_accessor :user_id, :questions_id

  def initialize(options)
    @user_id = options['user_id']
    @questions_id = options['questions_id']
  end

  def self.followers_for_question_id(question_id)
    raise "#{self} is not in table" unless question_id
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_follows ON users.id = question_follows.user_id
      WHERE
        question_follows.questions_id = ?
    SQL
    users.map { |user| User.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)
    raise "#{self} is not in table" unless user_id
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN
        question_follows ON question_follows.questions_id = questions.id
      WHERE
        question_follows.user_id = ?
    SQL
    questions.map { |question| Question.new(question) }
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.author_id, COUNT(*)
      FROM
        questions
      JOIN
        question_follows ON question_follows.questions_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC
      LIMIT
        ?
    SQL
    questions.map { |question| Question.new(question) }
  end
end
