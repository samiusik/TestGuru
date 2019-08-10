class AddCorrectOrNoToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :correct_or_no, :boolean
  end
end
