class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.string :name
      t.integer :subject_id
      t.integer :total_questions
      t.integer :time_limit

      t.timestamps
    end
    add_index :examinations, :subject_id
  end
end
