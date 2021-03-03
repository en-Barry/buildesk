class PostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend CarrierWave::Mount

  mount_uploader :image, PostImageUploader

  attribute :body, :string
  attribute :image, :string
  attribute :caption, :string 
  attribute :categories
  attribute :user_id, :integer

  validates :image, :categories, presence: :true

  def initialize(params = {})
    super(params)
  end

  def save
    return false if invalid?

    post = Post.new(post_params)
    
    #画像の複数登録仕様にはなっていない
    post.post_images.build(post_images_params).save!

    categories.each do |category|
      post.post_categories.build(category_id: category).save!
    end
    
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
end
