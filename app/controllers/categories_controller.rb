class CategoriesController < ApplicationController
  skip_before_action :require_login, only: %i[show]

  def show
    @category = Category.find_by(name: params[:name])
    @posts = @category.post_categories.includes(post: :user).order(created_at: :desc)
  end

  private

  def to_params
    name
  end
end
