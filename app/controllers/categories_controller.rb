class CategoriesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def index 
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def show
    @category = Category.find_by(name: params[:name])
    @posts = @category.post_categories.includes(post: :user).order(created_at: :desc)
  end

  private

  def to_params
    name
  end
end
