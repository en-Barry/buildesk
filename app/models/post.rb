class Post < ApplicationRecord
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories
  has_many :item_tags, dependent: :destroy
  has_many :items, through: :item_tags
  has_many :post_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  belongs_to :user

  enum area: { around: 0, focus: 1 }
end
