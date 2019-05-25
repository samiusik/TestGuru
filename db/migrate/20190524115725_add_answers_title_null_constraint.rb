class AddAnswersTitleNullConstraint < ActiveRecord::Migration[5.2]
  change_column_null(:answers, :title, false)
  def change
  end
end
