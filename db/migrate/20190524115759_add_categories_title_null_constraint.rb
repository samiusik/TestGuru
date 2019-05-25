class AddCategoriesTitleNullConstraint < ActiveRecord::Migration[5.2]
  change_column_null(:categories, :title, false)
  def change
  end
end
