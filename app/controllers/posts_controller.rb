class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_param)
  end
end
