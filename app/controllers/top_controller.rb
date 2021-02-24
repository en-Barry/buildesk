class TopController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc).limit(3)
    @engineer_posts = Category.find_by(name: 'Engineer').post_categories.includes(:post).limit(3)
    @gamer_posts = Category.find_by(name: 'Video creator').post_categories.includes(:post).limit(3)
    @vc_posts = Category.find_by(name: 'Writer').post_categories.includes(:post).limit(3)
  end
end
