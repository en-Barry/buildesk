class TopController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  
  def index
    @posts = Post.order(created_at: :desc).limit(3)
    @engineer_posts = Category.find_by(name: 'Engineer').post_categories.includes(:post).order(created_at: :desc).limit(3)
    @writer_posts = Category.find_by(name: 'Writer').post_categories.includes(:post).order(created_at: :desc).limit(3)
    @creator_posts = Category.find_by(name: 'MediaCreator').post_categories.includes(:post).order(created_at: :desc).limit(3)
  end
end
