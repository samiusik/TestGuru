class Answer < ApplicationRecord
  belongs_to :question

  #scope :correct_answer, -> { where (correct: 'correct') }
  scope :correct, -> {where(correct: true) }

  validates :title, presence: :true
  validate :validate_number_of_answers



  private

  def validate_number_of_answers
     errors.add(:answers, 'Very many answers') if question.answers.count >= 4
  end
end
