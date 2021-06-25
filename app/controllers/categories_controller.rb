class CategoriesController < ApplicationController
  skip_before_action :require_login, only: %i[show]

  def show
    @category = Category.find_by(name: params[:name])
    @posts = @category.posts.includes(:user, :post_images, :categories).order(created_at: :desc)
  end

  private

  def to_params
    name
  end
end
