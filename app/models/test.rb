class Test < ApplicationRecord
  has_many :test_users
  has_many :users, through: :test_users
  belongs_to :category
  has_many :questions
  belongs_to :author, class_name: 'User'

  scope :test_easy, -> { where(level: 0..1) }
  scope :test_medium, -> { where(level: 2..4) }
  scope :test_hard, -> { where(level: 5..Float::INFINITY) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  def self.names_with_category(category)
    joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
