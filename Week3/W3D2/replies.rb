require_relative 'users'
require_relative 'questions'
require_relative 'questions_database'

class Reply
  attr_accessor :questions_id, :parent_id, :user_id, :body

  def initialize(options)
    @id = options['id']
    @questions_id = options['questions_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end

  def self.find_by_id(id)
    raise "#{self} is not in table" unless id
    reply = QuestionsDatabase.instance.get_first_row(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    Reply.new(reply)
  end

  def self.find_by_user_id(user_id)
    raise "#{self} is not in table" unless user_id
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(questions_id)
    raise "#{self} is not in table" unless questions_id
    replies = QuestionsDatabase.instance.execute(<<-SQL, questions_id)
      SELECT
        *
      FROM
        replies
      WHERE
        questions_id = ?
    SQL
    replies.map { |reply| Reply.new(reply) }
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@questions_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_id)
  end

  def child_reply
    reply = QuestionsDatabase.instance.get_first_row(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL
    Reply.new(reply)
  end

end
