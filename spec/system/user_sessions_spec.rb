require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  before do
    let!(:user) { create(:user) }
  end

  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログイン処理が成功する' do
        click_link 'Login'
        fill_in 'Email',	with: user.email
        fill_in 'Password',	with: user.password
        click_button 'Login'
      end
    end
    context 'フォームが未入力' do
      it 'ログイン処理が失敗する' do
        
      end
    end
  end
  
  describe 'ログイン後' do
    context 'ログアウトボタンをクリック' do
      it 'ログアウト処理が成功する' do
        
      end
    end
  end
  
end
