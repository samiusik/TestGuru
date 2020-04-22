class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges
  validates :title, :image, :rule, presence: true

  BADGE_RULES = {
      'Passing all tests of the category' => :category_complete,
      'Passing the test on the first try' => :first_try,
      'Passing all tests of a certain level' => :level_complete
  }.freeze

  def self.images
    images_path = 'public'
    badges = Dir.glob("#{images_path}/badges/*")
    badges.map { |badge_path| badge_path.gsub(images_path, '') }
  end
end
