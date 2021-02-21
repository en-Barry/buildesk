class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, success: t('.Register successful')
    else
      flash.now[:danger] = t('.Register failed')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :description, :image)
  end
end
