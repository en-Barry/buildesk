class BookmarksController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.bookmark(post)
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    current_user.unbookmark(post)
    redirect_to post_path(post)
  end
end
