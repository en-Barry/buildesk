class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :post_set, only: %i[edit update destroy]

  def index
    @posts = Post.all.includes(:user, :post_images, :categories).order(created_at: :desc)
  end

  def new
    @form = PostsForm.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :asc)
    @like_count = @post.likes.count
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

  def likes
    @like_posts = current_user.like_posts.includes(:user, :post_images).order(created_at: :desc)
  end

  def bookmarks
    @bookmark_posts = current_user.bookmark_posts.includes(:user, :post_images).order(created_at: :desc)
  end

  private

  def post_set
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :body,
      :area,
      { images: [] },
      :image_cache,
      { category_ids: [] },
      { items1: [] },
      { items2: [] },
      { items3: [] },
      { items4: [] },
      { items5: [] }
    ).merge(user_id: current_user.id)
  end
end
