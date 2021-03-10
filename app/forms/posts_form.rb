class PostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend CarrierWave::Mount

  mount_uploader :image, PostImageUploader

  attribute :body, :string
  attribute :image, :string
  attribute :caption, :string
  attribute :category_ids
  attribute :user_id, :integer

  validates :image, :category_ids, presence: :true

  def initialize(params = {})
    super(params)
  end

  def save
    return false if invalid?

    post = Post.new(post_params)

    post.post_images.build(post_images_params).save!

    category_ids.each do |category_id|
      post.post_categories.build(category_id: category_id).save!
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
