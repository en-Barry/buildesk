class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:id])
    @like.save!
    redirect_to post_path(@post)
  end

  def destroy
    @like = Like.find_by(post_id: params[:id])
    @like.destroy!
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
