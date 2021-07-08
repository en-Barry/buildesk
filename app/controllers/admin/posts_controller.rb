class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @search = Post.ransack(params[:q])
    @posts = @search.result(distinct: true).order(created_at: :desc)
  end

  def show; end

  def edit; end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, success: t('defaults.message.deleted', post: post.model_name.human)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
