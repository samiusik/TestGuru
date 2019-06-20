class AddAuthorToTest < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author, index: true, foreign_key: {to_table: :users}
  end
end
