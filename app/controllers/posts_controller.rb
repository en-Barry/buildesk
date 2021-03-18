class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  before_action :post_set, only: %i[edit update destroy]

  def index
    @posts = Post.all.includes(:user, :post_images).order(created_at: :desc)
  end

  def new
    @form = PostsForm.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def create
    @form = PostsForm.new(post_params)
    
    if @form.save
      redirect_to posts_path, success: t('defaults.message.created', item: Post.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Post.model_name.human)
      render :new
    end
  end

  def edit
    @form = PostsForm.new(post: @post)
  end

  def update
    @form = PostsForm.new(post_params, post: @post)

    if @form.update
      redirect_to @post, success: t('defaults.message.updated', item: Post.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Post.model_name.human)
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to root_path, success: t('defaults.message.deleted', item: Post.model_name.human)
  end

  private

  def post_set
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :body,
      { images: [] },
      { category_ids: [] }
    ).merge(user_id: current_user.id)
  end
end
