require_relative 'users'
require_relative 'questions_database'
require_relative 'question_follows'

class Question
  attr_accessor :title, :body, :author_id

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def self.find_by_id(id)
    raise "#{self} is not in table" unless id
    question = QuestionsDatabase.instance.get_first_row(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    Question.new(question)
  end

  def self.find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    questions.map { |question| Question.new(question) }
    # returns array of question classes
  end

  def author
    User.find_by_id(@author_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def self.most_followed(n)
    users = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        *
      FROM
        users
      JOIN
        questions ON users.id = questions.author_id
      JOIN
        question_follows ON users.id = question_follows.user_id
      GROUP BY
        users.id
      ORDER BY
        COUNT(*) DESC, users.lname
      LIMIT
        ?
    SQL
    users.map { |user| User.new(user) }
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

end
