class PostsForm
  include ActiveModel::Model

  concerning :PostsBuilder do
    def post
      @post ||= Post.new
    end
  end

  concerning :PostImagesBuilder do
    attr_reader :post_images_attributes

    def post_images
      @post_images_attributes || = PostImage.new
    end

    def post_images_attributes=(attributes)
      @post_images_attributes = PostImage.new(attributes)
    end
  end

  attri_accessor :body, :category_ids
  
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
    
  end
end