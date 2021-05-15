RSpec.configure do |config|
  # ブラウザを非表示でテストする
  config.before(:each, type: :system) do
    driven_by :selenium, using: :headless_chrome
  end
  # ブラウザを表示してテストする
  config.before(:each, type: :system) do
    driven_by :selenium_chrome
  end
end
