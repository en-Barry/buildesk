class Post < ApplicationRecord
  has_many :post_category_categories, through: :post_categories, source: :category
  belongs_to :user

  validates :body, length: { maximum: 65535 }
end
