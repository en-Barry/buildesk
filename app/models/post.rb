class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories
  belongs_to :user

  validates :body, length: { maximum: 65_535 }
  validate :validate_categories

  def validate_categories
    errors.add(:categories, 'を一つ以上選択してください') if categories.empty?
  end
end
