class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = user.login(params[:email], params[:password])

    if @user.admin?
      redirect_back_or_to admin_root_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def destroy
    logout
    redirect_to admin_root_path, success: t('.success')
  end
end
