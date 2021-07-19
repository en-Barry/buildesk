class PostImage < ApplicationRecord
  mount_uploader :image, PostImageUploader
  belongs_to :post
  before_destroy :destroy_image_s3

  private

  def destroy_image_s3
    image.remove!
    image.thumb_1x1.remove!
    image.thumb_4x3.remove!
  rescue Excon::Errors::Error => e
    puts 'Something gone wrong'
    false
  end
end
