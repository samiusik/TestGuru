class ChangeDefaultCorrectForAnswers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:answers, :title, 'correct')
  end
end
