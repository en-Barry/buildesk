class Item < ApplicationRecord
  has_many :item_tags, dependent: :destroy
  has_many :posts, through: :item_tags
end
