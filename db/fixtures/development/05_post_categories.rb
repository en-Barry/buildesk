PostCategories.seed(
  post_id: Post.offset(Post.count).first
  category_id: PostCategories.offset(PostCategories.count).first
)

PostCategories.seed(
  post_id: Post.offset(Post.count)[2]
  category_id: PostCategories.offset(PostCategories.count)[2]
)

PostCategories.seed(
  post_id: Post.offset(Post.count)[3]
  category_id: PostCategories.offset(PostCategories.count)[3]
)

PostCategories.seed(
  post_id: Post.offset(Post.count)[4]
  category_id: PostCategories.offset(PostCategories.count)[2]
)

PostCategories.seed(
  post_id: Post.offset(Post.count)[5]
  category_id: PostCategories.offset(PostCategories.count)[3]
)