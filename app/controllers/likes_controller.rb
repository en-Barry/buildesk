class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_user.like(@post)
    @like_count = @post.likes.count
  end

  def destroy
    @post = Post.find(params[:id])
    current_user.unlike(@post)
    @like_count = @post.likes.count
  end
end
