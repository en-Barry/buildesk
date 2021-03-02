class PostsForm
  include ActiveModel::Model
  extend CarrierWave::Mount

  mount_uploader :image, PostImageUploader

  attr_accessor :body, :image, :caption, :category

  validates :image, presence: :true
  validates :category, presence: :true

  concerning :PostBuilder do
    def post
      @post ||= Post.new
    end
  end

  concerning :PostImagesBuilder do
    attr_reader :post_images_attributes

    def post_images
      @post_images_attributes ||= PostImage.new
    end

    def post_images_attributes=(attributes)
      @post_images_attributes = PostImage.new(attributes)
    end
  end

  concerning :PostCategoriesBuilder do
    attr_reader :post_categories_attributes

    def post_categories
      @categories_attributes ||= PostCategory.new
    end

    def post_categories_attributes=(attributes)
      @categories_attributes = PostCategory.new(attributes)
    end
  end

  def save
    return false if invalid?

    post.assign_attributes(post_params)
    build_associations

    if post.save
      true
    else
      false
    end
  end

  private

  def post_params
    {
      body: body
    }
  end

  def build_associations
    post.post_images << post_images
    post.post_categories << post_categories
  end
end
