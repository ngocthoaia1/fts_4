class Subject < ActiveRecord::Base
  has_many :subject_tests
  has_many :questions, dependent: :destroy
end
