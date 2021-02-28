class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def new
    @post_form = PostsForm.new
  end

  def create
    @post_form = current_user.posts.build(post_forms_params)
    
    #binding.pry
    
    if @post_form.save
      redirect_to posts_path, success: t('defaults.message.created', item: Post.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Post.model_name.human)
      render :new
    end
  end

  def update; end

  def destroy; end

  private

  def post_forms_params
    params.require(:post).permit(
      :body,
      post_images_attributes: [:image, :caption],
      category_ids: [])
  end
end
