class DropTablequestionAnswer < ActiveRecord::Migration[5.2]
  def change
    drop_table :question_answer
  end
end
