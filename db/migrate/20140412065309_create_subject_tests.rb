class CreateSubjectTests < ActiveRecord::Migration
  def change
    create_table :subject_tests do |t|
      t.integer :subject_id
      t.integer :total_questions
      t.datetime :time_limit

      t.timestamps
    end
    add_index :subject_tests, :subject_id
  end
end
