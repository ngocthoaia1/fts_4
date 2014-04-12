class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :subject_id
      t.string :content
      t.integer :level

      t.timestamps
    end
    add_index :questions, :subject_id
  end
end
