class User < ApplicationRecord
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id
  has_many :user_badges
  has_many :badges, through: :user_badges

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    self.is_a? Admin
  end
end
