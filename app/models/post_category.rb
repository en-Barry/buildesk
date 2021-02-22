class PostCategory < ApplicationRecord
  belongs_to :category
  belongs_to :post

  validates :category_id, uniqueness: { scope: :post_id }
end
