class User < ApplicationRecord
  has_many :test_users
  has_many :tests, through: :test_users

  def tests_in_level(level)
    tests.where(level: level)
  end
end
