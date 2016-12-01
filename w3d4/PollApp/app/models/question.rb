class Question < ApplicationRecord
  validates :text, :poll_id, presence: true

  belongs_to :poll,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Poll

  has_many :answer_choices,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results #return answer choices and count of answer_choices in AC table with this answer_choice_id

    results = {}

    answers_with_count = self.answer_choices
                             .select("answer_choices.*, COUNT(responses.*) AS responses_count")
                             .joins("LEFT OUTER JOIN responses ON responses.answer_choice_id = answer_choices.id")
                             .where("question_id = ?", self.id)
                             .group("answer_choices.id")

    answers_with_count.each do |ac|
      results[ac.text] = ac.responses_count
    end
    results
  end

end
