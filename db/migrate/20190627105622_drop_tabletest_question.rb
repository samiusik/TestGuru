class DropTabletestQuestion < ActiveRecord::Migration[5.2]
  def change
    drop_table :test_question
  end
end
