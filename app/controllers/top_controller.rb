class TopController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc).limit(3)
    @engineer_posts = Category.find_by(name: 'engineer').post_categories.limit(3)
  end
end
