class Admin::UserSessionsController < Admin::BaseController

  def create
    @user = user.login(params[:email], params[:password])

    if @user == 
  end

  def destroy

  end
end
