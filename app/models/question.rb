class Question < ApplicationRecord
  has_many :tests
  has_many :answers
end
