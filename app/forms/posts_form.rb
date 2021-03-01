class PostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend CarrierWave::Mount

  mount_uploader :image, PostImageUploader

  attribute :body
  attribute :image
  attribute :caption
  attribute :category_names

  validates :image, presence: :true
  validates :category_names, presence: :true

  delegate :persisted?, to: :post

  def initialize(attributes = nil, post = Post.new)
    @post = post
    attributes ||= default_attributes
    super(attributes)
  end

  concerning :PostImagesBuilder do
    def post_images
      @post_images_attributes ||= PostImage.new
    end

    def post_images_attributes=(attributes)
      @post_images_attributes = PostImage.new(attributes)
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

  def to_model
    post
  end

  private

  def post_params
    {
      body: body
    }
  end

  def build_associations
    post.post_images << post_images
    post.post_categories << category_names
  end
end
