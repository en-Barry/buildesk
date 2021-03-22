class LikesController < ApplicationController

  def create
    @like = current_user.likes.build(post_id: params[:post_id])
    if @like.save
      redirect_to post_path(@like.post)
    end
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:id])
    if @like.destroy!
      redirect_to post_path(@like.post)
    end
  end
end
