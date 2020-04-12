class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :name, null: false, default: 'My name'
      t.string :message, null: false
      t.string :phone_number
      t.string :email, null: false

      t.timestamps
    end
  end
end
