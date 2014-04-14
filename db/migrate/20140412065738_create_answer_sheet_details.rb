class CreateAnswerSheetDetails < ActiveRecord::Migration
  def change
    create_table :answer_sheet_details do |t|
      t.integer :answer_sheet_id
      t.integer :question_id
      t.integer :answer_id

      t.timestamps
    end
    add_index :answer_sheet_details, :answer_sheet_id
  end
end
