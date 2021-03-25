PostImages.seed(
  images: Rails.root.join('app/assets/images/20210226_233834.jpg')
  post_id: Post.offset(Post.count).first
)

PostImages.seed(
  images: Rails.root.join('app/assets/images/20210226_233834.jpg')
  post_id: Post.offset(Post.count)[2]
)

PostImages.seed(
  images: Rails.root.join('app/assets/images/20210226_233834.jpg')
  post_id: Post.offset(Post.count)[3]
)

PostImages.seed(
  images: Rails.root.join('app/assets/images/20210226_233834.jpg')
  post_id: Post.offset(Post.count)[4]
)

PostImages.seed(
  images: Rails.root.join('app/assets/images/20210226_233834.jpg')
  post_id: Post.offset(Post.count)[5]
)