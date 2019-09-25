class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  
  validates :title, presence: :true

  #def question_url
  #  super || default_question
  #end
end
