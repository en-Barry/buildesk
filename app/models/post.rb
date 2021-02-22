class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories
  belongs_to :user

  validates :body, length: { maximum: 65535 }
end
