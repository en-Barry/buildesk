class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(post_id: params[:post_id])
    redirect_to post_path(@like.post) if @like.save
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:id])
    redirect_to post_path(@like.post) if @like.destroy!
  end
end
