require 'fileutils'
Dir.chdir 'public/uploads/post_image/image/'
FileUtils.rm(Dir.glob('*.*'))

PostImage.seed(
  :id,
  { image: Rails.root.join('public/images/20210226_233834.jpg').open, post_id: Post.find(0).id },
  { image: Rails.root.join('public/images/20210226_233834.jpg').open, post_id: Post.find(1).id },
  { image: Rails.root.join('public/images/20210226_233834.jpg').open, post_id: Post.find(2).id },
  { image: Rails.root.join('public/images/20210226_233834.jpg').open, post_id: Post.find(3).id },
  { image: Rails.root.join('public/images/20210226_233834.jpg').open, post_id: Post.find(4).id }
)
