class PostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  extend CarrierWave::Mount

  mount_uploader :image, PostImageUploader

  attribute :body, :string
  attribute :area, :integer
  attribute :images
  attribute :category_ids
  attribute :user_id, :integer
  attribute :items
  attribute :items1
  attribute :items2
  attribute :items3
  attribute :items4
  attribute :items5

  validates :images, presence: true, presence: { message: :invalid_images }
  validates :area, presence: true
  validates :category_ids, presence: true, presence: { message: :invalid_category }

  validate :image_content_type
  validate :image_size

  delegate :persisted?, to: :@post

  def initialize(attributes = {}, post: Post.new)
    @post = post
    new_attributes = default_attributes.merge(attributes)
    super(new_attributes)
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

      items_params&.each do |item|
        h_item = eval(item) # セキュリティホール的に非推奨らしい
        new_item = Item.new(h_item)
        
        if Item.exists?(item_code: h_item[:item_code])
          exist_item = Item.find_by(item_code: h_item[:item_code])
          post.item_tags.create!(item_id: exist_item.id)
        else
          new_item.save!
          post.item_tags.create!(item_id: new_item.id)
        end
      end
    end

    true
  end

  def update
    return false if invalid?

    ActiveRecord::Base.transaction do
      @post.update!(post_params)

      @post.category_ids = category_ids
    end
  rescue ActiveRecord::RecordNotFound
    false
  end

  def to_model
    @post
  end

  private

  def post_params
    {
      body: body,
      area: area,
      user_id: user_id
    }
  end

  def items_params
    items = (items1 + items2 + items3 + items4 + items5).reject(&:empty?)
    if items.empty?
      nil
    else
      items
    end
  end

  def default_attributes
    {
      body: @post.body,
      area: @post.area,
      user_id: @post.user_id,
      images: @post.post_images.map(&:image),
      category_ids: @post.post_categories
    }
  end

  def image_content_type
    extension_whitelist = %w[image/jpg image/jpeg image/png]

    images&.each do |image|
      errors.add(:images, 'は jpg/jpeg/png が許可されています') unless extension_whitelist.include?(image.content_type)
    end
  end

  def image_size
    images&.each do |image|
      errors.add(:images, 'は5MB以下のファイルまでアップロードできます') if image.size > 5.megabytes
    end
  end
end
