class TopController < ApplicationController
  skip_before_action :require_login, only: %i[index user_policy]

  def index
    @posts = Post.all.includes(:user, :post_images, :categories).order(created_at: :desc).limit(4)
  end

  def user_policy
    render file: 'public/user_policy', layout: true, content_type: 'text/html'
  end
end
