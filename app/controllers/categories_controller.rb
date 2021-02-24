class CategoriesController < ApplicationController
  skip_before_action :require_login, only: %i[show]

  def show
    @posts = Category.find(params[:id]).post_categories.includes(:post).order(created_at: :desc)
  end
end
