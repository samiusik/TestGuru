class AddAnswersTitleNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:answers, :title, false)
  end
end
