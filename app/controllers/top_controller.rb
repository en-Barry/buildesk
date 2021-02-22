class TopController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
    @engineer_posts = @posts.post_categories(category_id: 1).limit(3)
  end
end
