class Answer < ActiveRecord::Base
  belongs_to :question

  def correct?
    correct
  end
end
