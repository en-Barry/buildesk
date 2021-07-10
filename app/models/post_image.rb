class PostImage < ApplicationRecord
  mount_uploader :image, PostImageUploader
  belongs_to :post
  before_destroy :destroy_image_s3

  private

  def destroy_image_s3
    image.remove!
    image.thumb.remove!
    image.main.remove!
  rescue Excon::Errors::Error => error
    puts "Something gone wrong"
    false
  end
end
