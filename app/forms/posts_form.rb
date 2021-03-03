class PostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend CarrierWave::Mount

  mount_uploader :image, PostImageUploader

  attribute :body, :string
  attribute :image, :string
  attribute :caption, :string 
  attribute :categories
  attribute :post_id, :integer

  validates :image, :categories, presence: :true

  def initialize(params = {})
    super(params)
  end

  def save
    return false if invalid?

    post = Post.new(post_params).save!
    
    post.post_images.build(image: image, caption: caption).save!
    post.post_categories.build(category_id: categories).save!
    
    binding.pry
    
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
