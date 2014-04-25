class CreateAnswerSheets < ActiveRecord::Migration
  def change
    create_table :answer_sheets do |t|
      t.integer :user_id
      t.integer :examination_id
      t.integer :total_correct_answered
      t.boolean :passed

      t.timestamps
    end

    add_index :answer_sheets, :user_id
    add_index :answer_sheets, :examination_id
  end
end
