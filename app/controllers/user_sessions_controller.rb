class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to root_path, success: t('.Login successful')
    else
      flash.now[:danger] = t('.Login failed')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('.Logged out')
  end
end
