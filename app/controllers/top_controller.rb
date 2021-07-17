class TopController < ApplicationController
  skip_before_action :require_login, only: %i[index user_policy privacy_policy]

  def index
    @posts = Post.all.includes(:user, :post_images, :categories).order(created_at: :desc).limit(4)
  end

  def user_policy; end

  def privacy_policy; end
end
