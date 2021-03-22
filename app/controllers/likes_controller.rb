class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = current_user.likes.create(post_id: params[:id])
    redirect_to post_path(@post)
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy!
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
