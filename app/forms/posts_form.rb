class PostsForm
  include ActiveModel::Model
  extend CarrierWave::Mount

  mount_uploader :image, PostImageUploader
  attr_accessor :image, :caption, :body, :post_categories

  validates :body, length: { maximum: 65_535 }
  validates :image, presence: :true
  validate :validate_categories

  concerning :PostsBuilder do
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

  concerning :PostCategories do
    attr_reader :post_categories_attributes

    def post_categories
      @post_categories_attributes ||= PostCategory.new
    end

    def post_categories_attributes=(attributes)
      @post_categories_attributes = PostCategory.new(attributes)
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
      body: body,
    }
  end

  def build_associations
    post.post_images << post_images
    post.post_categories << post_categories
  end

  def validate_categories
    errors.add(:post_category, 'を一つ以上選択してください') if post_categories.empty?
  end
end