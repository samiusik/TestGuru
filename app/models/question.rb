class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  has_many :gists
  validates :title, presence: :true

  #def question_url
  #  super || default_question
  #end
end
