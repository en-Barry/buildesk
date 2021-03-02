class PostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend CarrierWave::Mount

  mount_uploader :image, PostImageUploader

  attribute :body
  attribute :image
  attribute :caption
  attribute :category

  validates :image, presence: :true
  validates :category, presence: :true

  concerning :PostBuilder do
    def post
      @post ||= Post.new
    end
  end

  concerning :PostImagesBuilder do
    def post_images
      @post_images_attributes ||= PostImage.new
    end

    def post_images_attributes=(attributes)
      @post_images_attributes = PostImage.new
    end
  end

  concerning :CategoriesBuilder do
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
