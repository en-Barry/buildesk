class BookmarksController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_user.bookmark(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    current_user.unbookmark(@post)
  end
end
