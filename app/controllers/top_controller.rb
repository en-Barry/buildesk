class TopController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @posts = Post.all.includes(:user, :post_images).order(created_at: :desc).limit(3)
  end
end
