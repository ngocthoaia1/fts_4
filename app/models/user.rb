class User < ActiveRecord::Base
  has_many :answer_sheets
  has_many :subject_tests, through: :answer_sheets

  has_secure_password
end
