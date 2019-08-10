class ChangeColumnNameForAnswersTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :correct_or_no, :correct
  end
end
