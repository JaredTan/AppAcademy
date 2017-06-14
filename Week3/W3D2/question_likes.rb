require_relative 'users'
require_relative 'questions'
require_relative 'questions_database'

class QuestionLike
  attr_accessor :likes, :user_id, :questions_id

  def initialize(options)
    @likes = options['likes']
    @user_id = options['user_id']
    @questions_id = options['questions_id']
  end

  def self.likers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_likes ON users.id = question_likes.user_id
      WHERE
        question_likes.questions_id = ?
    SQL
    users.map { |user| User.new(user) }
  end

  def self.num_likes_for_question_id(question_id)
    #QuestionLike.likers_for_question_id(question_id).count #BAD
    count = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        SUM(likes)
      FROM
        question_likes
      WHERE
        questions_id = ?
      GROUP BY
        questions_id
      SQL
    count
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.questions_id
      WHERE
        question_likes.user_id = ?
      GROUP BY
        questions.id
    SQL
    questions.map { |question| Question.new(question) }
  end

  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.questions_id
      GROUP BY
        questions.id
      ORDER BY
        SUM(likes) DESC
      LIMIT
        ?
    SQL
    questions.map { |question| Question.new(question) }
  end

end
