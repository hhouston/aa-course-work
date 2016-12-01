class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :user_already_answered
  validate :user_answered_own_poll

  belongs_to :user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  belongs_to :answer_choice,
    foreign_key: :answer_choice_id,
    primary_key: :id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def user_already_answered
    if sibling_responses.exists?(user_id: self.user_id)
      errors[:user] << 'already answered this question'
    end
  end

  def user_answered_own_poll
    if self.question.poll.author_id == self.user_id
      errors[:user] << 'cannot answer own poll'
    end
  end



end
