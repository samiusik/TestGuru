class CreateTestPassages < ActiveRecord::Migration[5.2]
  def change
    create_table :test_passages do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.references :current_question, foreign_key: false
      t.integer :correct_question, default: 0

      t.timestamps
    end
    add_foreign_key :test_passages, :users, column: :current_question_id
  end
end
