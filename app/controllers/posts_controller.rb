class PostsController < ApplicationController

  def index 
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create 
    @post = current_path.posts.build(post_param)
    if @post.save
      redirect_to categories_path(@post.category.name), success: t('defaults.message.created', item: Post.model_name_human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Post.model_name_human)
      render :new
    end
  end

  def update 

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:body, {category_ids: []}) 
  end
end
