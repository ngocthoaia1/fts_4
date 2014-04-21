# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create!(name: "Admin", email: "admin@example.com", password: "foobar",
  password_confirmation: "foobar")

(0..20).each do |i|
  User.create!(name:"User #{i}", email: "user#{i + 1}@example.com", password: "foobar",
    password_confirmation: "foobar")
end

subjects = ["Rails", "Git", "Mysql"]
(0..2).each do |i|
  subject = Subject.create!(name: "#{subjects[i]}")
  (0..9).each do |j|
    question = subject.questions.create!(content: "question #{j + 1}", level: 1)
    correct_answer = rand(4)
    (0..3).each do |k|
      answer = question.answers.build(content: "answer #{k + 1}")
      answer.correct = true if k == correct_answer
      answer.save
    end
  end

  subject.examinations.create!(name: "#{subject.name} examination",
    total_questions: 8, time_limit: 30)
end

Examination.all[0..2].each do |examination|
  User.all[0..5].each do |user|
    answer_sheet = user.answer_sheets.create(examination_id: examination.id)
    subject_questions = examination.subject.questions
    (0..(examination.total_questions - 1)).each do |k|
      answer_sheet.answer_sheet_details.create(
        question_id: subject_questions[k])
    end
  end
end