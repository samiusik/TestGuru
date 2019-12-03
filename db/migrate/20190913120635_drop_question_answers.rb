class DropQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
   drop_table :question_answers
  end
end
