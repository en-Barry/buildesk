PostCategory.seed(
  :id,
  { post_id: Post.find(0).id, category_id: 1 },
  { post_id: Post.find(1).id, category_id: 1 },
  { post_id: Post.find(2).id, category_id: 2 },
  { post_id: Post.find(3).id, category_id: 2 },
  { post_id: Post.find(4).id, category_id: 3 }
)
