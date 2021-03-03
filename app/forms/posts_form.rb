class PostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend CarrierWave::Mount

  mount_uploader :image, PostImageUploader

  attribute :body, :string
  attribute :image, :string
  attribute :caption, :string 
  attribute :category_id
  attribute :user_id, :integer

  validates :image, :category_id, presence: :true

  def initialize(params = {})
    super(params)
  end

  def save
    return false if invalid?

    post = Post.new(post_params)
    
    post.post_images.build(post_images_params).save!
    post.post_categories.build(post_categories_params).save!
    
    binding.pry
    
    post.save ? true : false
  end

  private

  def post_params
    {
      body: body,
      user_id: user_id
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
      category_id: category_id
    }
  end
end
