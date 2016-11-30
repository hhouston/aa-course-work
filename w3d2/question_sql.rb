require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :fname, :lname

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ?
        AND lname = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def authored_questions
    Question.find_by_author(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    karma = QuestionsDatabase.instance.execute(<<-SQL, @id)
      -- SELECT
      --   COUNT(q.id)
      -- FROM
      --   questions q
      -- JOIN
      --   users u ON u.id = q.author_id
      -- WHERE
      --   q.author_id = ?


      -- SELECT
      --   COUNT(ql.user_id)
      -- FROM
      --   question_likes ql
      -- JOIN
      --   questions q ON q.id = ql.question_id
      -- WHERE
      --   q.author_id = ?

      SELECT
        CAST(COUNT(ql.user_id) AS FLOAT) / COUNT(DISTINCT(q.id))
      FROM
        questions q
      JOIN
        question_likes ql ON q.id = ql.question_id
      JOIN
        users u ON u.id = q.author_id
      WHERE
        q.author_id = ?
    SQL
    return nil unless karma.length > 0
    karma.first.values.first
  end

  def save
    if @id
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
        UPDATE
          users
        SET
          fname = ?, lname = ?
        WHERE
          id = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
        INSERT INTO
          users (fname, lname)
        VALUES
          (?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end

  def delete
    raise "#{self} not in db" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @id)
      DELETE FROM
        users
      WHERE
        id = ?
    SQL
  end
end

class Question
  attr_accessor :title, :body

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        questions
    SQL

    data.map { |datum| Question.new(datum)}
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    return nil unless question.length > 0
    Question.new(question.first)
  end

  def self.find_by_author(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL

    return nil unless questions.length > 0
    questions.map { |question| Question.new(question) }
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
    QuestionFollow.most_followed_questions(n)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question(@id)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

end

class QuestionFollow

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    question_follows = QuestionDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    return nil unless question_follows.length > 0
    QuestionFollow.new(question_follows.first)
  end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users JOIN question_follows ON users.id = question_follows.user_id
      WHERE
        question_follows.question_id = ?
    SQL

    return nil unless followers.length > 0
    followers.map { |follower| User.new(follower) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?
    SQL
    return nil unless questions.length > 0
    questions.map { |question| Question.new(question) }
  end

  def self.most_followed_questions(n)
    most_followed_questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_id
      GROUP BY
        question_id
      ORDER BY
        COUNT(question_id) DESC
      LIMIT
        ?
    SQL
    return nil unless most_followed_questions.length > 0
    most_followed_questions.map { |question| Question.new(question) }
  end

end

class Reply
  attr_accessor :body
  attr_reader :id

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @user_id = options['user_id']
    @body = options['body']
  end

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        replies
    SQL

    data.map { |datum| Reply.new(datum)}
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0
    Reply.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return nil if replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    return nil unless replies.length > 0
    replies.map { |reply| Reply.new(reply) }
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_reply_id)
  end

  def child_replies
    reply = QuestionsDatabase.instance.execute(<<-SQL, id: id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = :id
    SQL
    return nil unless reply.length > 0
    Reply.new(reply.first)
  end
end

class QuestionLike

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    question_likes = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    return nil unless question_likes.length > 0
    QuestionLike.new(question_likes.first)
  end

  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        u.*
      FROM
        users u
      JOIN
        question_likes q ON u.id = q.user_id
      WHERE
        q.question_id = ?
    SQL
    return nil unless likers.length > 0
    likers.map { |liker| User.new(liker) }
  end

  def self.num_likes_for_question(question_id)
    num_likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(u.id) AS 'Num of Likers'
      FROM
        users u
      JOIN
        question_likes q ON u.id = q.user_id
      WHERE
        q.question_id = ?
    SQL
    return nil if num_likers.nil?
    num_likers.first.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        q.*
      FROM
        questions q
      JOIN
        question_likes ql ON ql.question_id = q.id
      WHERE
        ql.user_id = ?
    SQL
    return nil unless questions.length > 0
    questions.map { |question| Question.new(question) }
  end

  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        q.*
      FROM
        questions q
      JOIN
        question_likes ql ON q.id = ql.question_id
      GROUP BY
        q.id
      ORDER BY
        COUNT(q.id) DESC
      LIMIT
        ?
    SQL
    return nil unless questions.length > 0
    questions.map { |question| Question.new(question) }
  end

end
