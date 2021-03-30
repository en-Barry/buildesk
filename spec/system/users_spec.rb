require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end
  
  let(:user) { create(:user) }
  let(:user_others) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:post_by_others) { create(:post, user: user_others)}

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
          expect(current_path).to eq(root_path), 'ページが正しく遷移されていません'
          expect(page).to have_content('ユーザー登録しました'), 'サクセスメッセージが表示されていません'
        end
      end
      context 'メールアドレスが未入力' do
        it '新規登録に失敗する' do
          visit new_user_path
          fill_in 'ユーザーネーム',	with: 'test'
          fill_in 'パスワード',	with: 'password'
          fill_in 'パスワード確認',	with: 'password'
          click_button '登録する'
          expect(current_path).to eq(users_path), 'ページが正しく遷移されていません'
          expect(page).to have_content('ユーザー登録に失敗しました'), 'エラーメッセージが表示されていません'
          expect(page).to have_content('メールアドレスを入力してください'), 'フォームのエラーが表示されていません'
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
          expect(current_path).to eq(users_path), 'ページが正しく遷移されていません'
          expect(page).to have_content('ユーザー登録に失敗しました'), 'エラーメッセージが表示されていません'
          expect(page).to have_content('メールアドレスはすでに存在します'), 'フォームのエラーが表示されていません'
        end
      end
    end
  end

  describe "ログイン後" do

    before do
      login(user)
    end

    describe "マイページの表示" do
      context "自分のマイページを表示" do
        it "正しく表示される" do
          visit user_path(user)
          expect(page).to have_selector("#user-id-#{user.id}"), 'ユーザー情報が表示されていません'
          expect(page).not_to have_selector("#user-id-#{user_others.id}"), '別のユーザー情報が表示されています'
          expect(page).to have_selector("#post-id-#{post.id}"), 'ユーザーの投稿が表示されていません'
          expect(page).not_to have_selector("#post-id-#{post_by_others.id}"), '他人の投稿が表示されています'  
        end
      end
      context "他人のマイページを表示" do
        it "正しく表示される" do
          visit user_path(user_others)
          expect(page).not_to have_selector("#user-id-#{user.id}"), '自分のユーザー情報が表示されています'
          expect(page).to have_selector("#user-id-#{user_others.id}"), 'ユーザー情報が表示されていません'
          expect(page).not_to have_selector("#post-id-#{post.id}"), '自分の投稿が表示されています'
          expect(page).to have_selector("#post-id-#{post_by_others.id}"), 'ユーザーの投稿が表示されていません'
        end
      end
    end

    describe "プロフィールの編集" do
      context "フォームの入力値が正常" do
        it "更新に成功する" do
          visit edit_profile_path(user)
          fill_in 'ユーザーネーム', with: 'username'
          fill_in '自己紹介', with: 'description_test'
          attach_file 'プロフィール画像', "#{Rails.root}/spec/fixtures/20210227_005224.jpg"
          click_on '更新する'
          expect(current_path).to eq(edit_profile_path(user)), 'ページが正しく遷移していません'
          expect(page).to have_content('プロフィールを更新しました'), 'サクセスメッセージが表示されていません'
          expect(page).to have_selector("img[src$='20210227_005224.jpg']"), '登録した画像が表示されていません' 
        end
      end
      context "ユーザーネームが未入力" do
        it "更新に失敗する" do
          visit edit_profile_path(user)
          fill_in 'ユーザーネーム', with: ''
          click_on '更新する'
          expect(current_path).to eq(profile_path), 'ページが正しく遷移していません'
          expect(page).to have_content('プロフィールを更新できません'), 'エラーメッセージが表示されていません'
          expect(page).to have_content('ユーザーネームを入力してください'), 'フォームのエラーメッセージが表示されていません'
        end
      end
    end
  end
end
