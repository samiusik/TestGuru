class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update


  PERCENTS_SUCCESS = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def success?
    percent >= PERCENTS_SUCCESS
  end

  def percent
    correct_questions * 100 / test.questions.count
  end

  def question_number
    test.questions.order(id: :asc).index(current_question) + 1
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_question += 1 
      #опечатка в видео self.correct_questions += 1 
    end

    self.current_question = next_question
    save!
  end



  private

  def before_validation_set_first_question
    self.current_question = test.questions.order(:id).first if test.present?    
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
