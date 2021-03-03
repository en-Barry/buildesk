class PostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend CarrierWave::Mount

  mount_uploader :image, PostImageUploader

  attribute :body, :string
  attribute :image, :string
  attribute :caption, :string 
  attribute :categories

  validates :image, :categories, presence: :true

  def initialize(params = {})
    super(params)
  end

  def save
    return false if invalid?

    post = Post.new(post_params)
    
    post.post_categories << PostCategory.new(post_categories_params)
    post.post_images << PostImage.new(post_images_params)
    post.save ? true : false
  end

  private

  def post_params
    {
      body: body
    }
  end

  def post_images_params
    {
      image: image,
      caption: caption
    }
  end

  def post_categories_params
    {
      category_id: categories
    }
  end
end
