class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

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

  def update; end

  def destroy; end

  private

  def post_params
    params.require(:posts_form).permit(
      :body,
      { images: [] }, 
      { category_ids: [] }
    ).merge(user_id: current_user.id)
  end
end
