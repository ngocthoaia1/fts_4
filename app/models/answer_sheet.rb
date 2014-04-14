class AnswerSheet < ActiveRecord::Base
  has_many :answer_sheet_details
  belongs_to :subject_test
end
