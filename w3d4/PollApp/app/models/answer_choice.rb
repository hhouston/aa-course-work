class AnswerChoice < ApplicationRecord
  validates :text, :question_id, presence: true

  belongs_to :question,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: :Question

  has_many :responses,
    foreign_key: :answer_choice_id,
    primary_key: :id,
    class_name: :Response

end
