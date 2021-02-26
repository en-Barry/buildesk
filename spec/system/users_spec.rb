require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it '新規登録が成功する' do
          visit new_user_path
          fill_in 'ユーザーネーム',	with: 'test'
          fill_in 'メールアドレス', with: 'test@example.com'
          fill_in 'パスワード',	with: 'password'
          fill_in 'パスワード確認',	with: 'password'
          click_button '登録する'
          expect(current_path).to eq root_path
          expect(page).to have_content('ユーザー登録しました')
        end
      end
      context 'メールアドレスが未入力' do
        it '新規登録に失敗する' do
          visit new_user_path
          fill_in 'ユーザーネーム',	with: 'test'
          fill_in 'パスワード',	with: 'password'
          fill_in 'パスワード確認',	with: 'password'
          click_button '登録する'
          expect(current_path).to eq users_path
          expect(page).to have_content('ユーザー登録に失敗しました')
          expect(page).to have_content('メールアドレスを入力してください')
        end
      end
      context '登録済のメールアドレスを入力' do
        it '新規登録に失敗する' do
          visit new_user_path
          fill_in 'ユーザーネーム',	with: 'test'
          fill_in 'メールアドレス',	with: user.email
          fill_in 'パスワード',	with: 'password'
          fill_in 'パスワード確認',	with: 'password'
          click_button '登録する'
          expect(current_path).to eq users_path
          expect(page).to have_content('ユーザー登録に失敗しました')
          expect(page).to have_content('メールアドレスはすでに存在します')
        end
      end
    end
  end
end
