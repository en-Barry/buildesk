class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]

    if params[:denied].present?
      redirect_to root_path, notice: 'ログインをキャンセルしました'
      return
    end

    @user = login_from(provider)

    if @user
      redirect_to root_path, success: "#{provider.titleize}でログインしました"
    else
      begin
        @user = create_from(provider)
        @user.uuid = SecureRandom.alphanumeric(10) if @user.uuid.include?('@')
        @user.save
        reset_session
        auto_login(@user)
        redirect_to root_path, success: "#{provider.titleize}でログインしました"
      rescue StandardError
        redirect_to root_path, danger: "#{provider.titleize}のログインに失敗しました"
      end
    end
  end
end
