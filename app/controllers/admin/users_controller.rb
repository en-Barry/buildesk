class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @search = User.ransack(params[:q])
    @users = @search.result(distinct: true).order(created_at: :desc)
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), success: t('defaults.message.updated', item: User.model_name.human)
    else
      render :edit, danger: t('defaults.message.not_updated', item: User.model_name.human)
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_root_path(@user), success: t('defaults.message.deleted', item: User.model_name.human)
  end

  private

  def set_user
    @user = User.find_by(uuid: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :role, :uuid, :password, :password_confirmation, :image, :image_cache)
  end
end
