class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def new
    @post_form = PostsForm.new
  end

  def create
    @post_form = PostsForm.new(post_form_params)
    
    binding.pry
    
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

  def post_form_params
    params.require(:posts_form).permit(
      :body,
      post_images_attributes: [:image, :caption],
      post_categories_attributes: [:post_category]
    )
  end
end
