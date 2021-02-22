class Category < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories
  
  validates :name, presence: true, uniqueness: true
end
