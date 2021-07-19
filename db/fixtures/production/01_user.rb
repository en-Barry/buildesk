User.create!(
  name: Rails.application.credentials.dig(:user, :admin, :name),
  email: Rails.application.credentials.dig(:user, :admin, :email),
  password: Rails.application.credentials.dig(:user, :admin, :password),
  password_confirmation: Rails.application.credentials.dig(:user, :admin, :password_confirmation),
  uuid: Rails.application.credentials.dig(:user, :admin, :uuid),
  role: Rails.application.credentials.dig(:user, :admin, :role)
)
