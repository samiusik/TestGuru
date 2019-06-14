class Test < ApplicationRecord
  has_many :test_users
  has_many :users, through: :test_users
  belongs_to :category

  def self.names_with_category(category)
    joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
