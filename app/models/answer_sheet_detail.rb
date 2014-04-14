class AnswerSheetDetail < ActiveRecord::Base
  belongs_to :answer_sheet
  belongs_to :question
  belongs_to :answer
end
