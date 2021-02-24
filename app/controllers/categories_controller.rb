class CategoriesController < ApplicationController

  def show
    @posts = Category.find(params[:id]).post_categories.includes(:post).order(created_at: :desc)
  end
end
