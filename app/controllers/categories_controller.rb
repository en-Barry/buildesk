class CategoriesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index 
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def show
    @posts = Category.find(params[:id]).post_categories.includes(:post).order(created_at: :desc)
  end
end
