class AnswerSheet < ActiveRecord::Base
  has_many :answer_sheet_details
  belongs_to :subject_test

  accepts_nested_attributes_for :answer_sheet_details, allow_destroy: true

  before_update :update_total_correct_answered

  scope :create_answer_sheet, lambda { |examination, user|
    answer_sheet = self.new examination_id: examination, user_id: user
    questions = examination.subject.questions.shuffle
    (0..examination.total_questions - 1).each do |i|
      answer_sheet.answer_sheet_details.build(question_id: questions[i + 1].id)
    end
    answer_sheet.save
    answer_sheet
  }

  private

    def update_total_correct_answered
      count = 0
      self.answer_sheet_details.each do |answer_sheet_detail|
        if answer_sheet_detail.answer.present? && answer_sheet_detail.answer.correct?
          count = count + 1
        end
      end
      self.total_correct_answered = count
    end
end
