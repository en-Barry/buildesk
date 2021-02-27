class PostImage < ApplicationRecord
  mount_uploader :image, PostImageUploader
  belongs_to :post

  validates :image, presence: :true
end
