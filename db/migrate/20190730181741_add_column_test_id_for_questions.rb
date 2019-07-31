class AddColumnTestIdForQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :test
  end
end
