class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create show]

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(uuid: params[:uuid])
    if @user.present?
      @posts = @user.posts.includes(:user, :post_images, :items).order(created_at: :desc)
      @items = @posts.map { |post| post.items }.flatten.uniq
    else
      render 'non_user'
    end
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
