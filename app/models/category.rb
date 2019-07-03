class Category < ApplicationRecord
  has_many :tests

  scope :ordered_by_title, -> { order(title: :asc) }

  validates :title, presence: :true
  
end
