class TopController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  
  def index
    @posts = Post.includes(:user, :categories).order(created_at: :desc).limit(3)
    @engineer_posts = PostCategory.where(category_id: 1).includes(:post, :category).order(created_at: :desc).limit(3)
    @writer_posts = PostCategory.where(category_id: 2).includes(:post, :category).order(created_at: :desc).limit(3)
    @creator_posts = PostCategory.where(category_id: 3).includes(:post, :category).order(created_at: :desc).limit(3)
  end
end
