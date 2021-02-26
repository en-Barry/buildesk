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
      redirect_to categories_path(@post.category.name), success: t('')
    else
      flash.now['danger'] = t('')
      render :new
    end
  end

  def update 

  end

  def destroy

  end

  private

  def post_params

  end
end
