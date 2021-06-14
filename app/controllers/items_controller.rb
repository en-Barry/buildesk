class ItemsController < ApplicationController
  skip_before_action :require_login, only: %i[show]
  
  def show
    @item = Item.find(params[:id])
    @posts = @item.posts.includes(:user, :post_images, :categories).order(created_at: :desc)
  end
end
