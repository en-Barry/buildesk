class PostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend CarrierWave::Mount

  mount_uploader :image, PostImageUploader

  attribute :body, :string
  attribute :images
  attribute :category_ids
  attribute :user_id, :integer

  validates :images, presence: :true
  validates :category_ids, presence: :true

  def initialize(params = {})
    super(params)
  end

  def save
    return false if invalid?

    post = Post.new(post_params)
    post.save!

    images.each do |image|
      post.post_images.create!(image: image)
    end

    category_ids.each do |category_id|
      post.post_categories.create!(category_id: category_id)
    end

    post
  end

  private

  def post_params
    {
      body: body,
      user_id: user_id
    }
  end
end
