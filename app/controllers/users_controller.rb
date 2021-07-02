class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create show]

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(uuid: params[:uuid])
    @posts = @user.posts.includes(:user, :items, :post_images).order(created_at: :desc)
  end

  def create
    @user = User.new(user_params)
    @user.uuid ||= SecureRandom.alphanumeric(10)
    
    if @user.save
      login(params[:user][:email], params[:user][:password])
      redirect_to root_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :description, :image, :uuid)
  end
end
