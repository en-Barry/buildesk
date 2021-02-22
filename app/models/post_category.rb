class PostCategory < ApplicationRecord
  belongs_to :category
  belongs_to :post

  validates :post_id, uniqueness: { scope: category_id }
end
