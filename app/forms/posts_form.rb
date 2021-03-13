class PostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend CarrierWave::Mount

  mount_uploader :image, PostImageUploader

  attribute :body, :string
  attribute :images
  attribute :category_ids
  attribute :user_id, :integer

  validates :images, presence: true
  validates :category_ids, presence: true

  validate :image_content_type
  validate :image_size

  delegate :persisted?, to: :post

  def initialize(attribute)
    @attribute = attribute
  end

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      post = Post.new(post_params)
      post.save!

      images.each do |image|
        post.post_images.create!(image: image)
      end

      category_ids.each do |category_id|
        post.post_categories.create!(category_id: category_id)
      end
    end

    true
  end

  def to_model
    post
  end

  private

  def post_params
    {
      body: body,
      user_id: user_id
    }
  end

  def default_attributes
    {
      body: body,
      user_id: user_id
    }
  end

  def image_content_type
    return false if images.blank?

    extension_whitelist = %w[image/jpg image/jpeg image/png]

    images.each do |image|
      errors.add(:images, 'は jpg/jpeg/png が許可されています') unless extension_whitelist.include?(image.content_type)
    end
  end

  def image_size
    return false if images.blank?

    images.each do |image|
      errors.add(:images, 'は5MB以下のファイルまでアップロードできます') if image.size > 5.megabytes
    end
  end
end
