class Test < ApplicationRecord
  has_many :test_users
  has_many :users, through: :test_users
  belongs_to :category
  has_many :questions
  belongs_to :author, class_name: 'User'
  def self.names_with_category(category)
    joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
