require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  include CarrierWave::Test::Matchers
  before do
    driven_by(:rack_test)
  end

  describe '投稿のCRUD' do
    let(:user) { create(:user) }
    let!(:post) { create(:post) }
    let!(:post_with_engineer) { create(:post, :with_engineer) }
    let!(:post_with_writer) { create(:post, :with_writer) }
    let!(:post_with_mediacreator) { create(:post, :with_mediacreator) }

    describe 'トップページの表示' do
      context '新着の表示' do
        it '最新の投稿が表示される' do
          visit root_path
          expect(page).to have_selector("#post-id-#{post_with_mediacreator.id}")
        end
      end
    end

    describe 'カテゴリ別一覧の表示' do
      context '全カテゴリ一覧ページ' do
        it '投稿一覧が表示される' do
          visit posts_path
          expect(page).to have_selector("#post-id-#{post_with_engineer.id}")
          expect(page).to have_selector("#post-id-#{post_with_writer.id}")
          expect(page).to have_selector("#post-id-#{post_with_mediacreator.id}")
        end
      end
      context 'エンジニアのページ' do
        it '投稿一覧が表示される' do
          visit category_path('Engineer')
          expect(page).to have_selector("#post-id-#{post_with_engineer.id}")
          expect(page).not_to have_selector("#post-id-#{post_with_writer.id}")
          expect(page).not_to have_selector("#post-id-#{post_with_mediacreator.id}")
        end
      end
      context 'ライターのページ' do
        it '投稿一覧が表示される' do
          visit category_path('Writer')
          expect(page).to have_selector("#post-id-#{post_with_writer.id}")
          expect(page).not_to have_selector("#post-id-#{post_with_engineer.id}")
          expect(page).not_to have_selector("#post-id-#{post_with_mediacreator.id}")
        end
      end
      context '動画系クリエイター' do
        it '投稿一覧が表示される' do
          visit category_path('MediaCreator')
          expect(page).to have_selector("#post-id-#{post_with_mediacreator.id}")
          expect(page).not_to have_selector("#post-id-#{post_with_engineer.id}")
          expect(page).not_to have_selector("#post-id-#{post_with_writer.id}")
        end
      end
    end

    describe '投稿の作成' do
      context 'ログインしていない場合' do
        it 'ログインページにリダイレクトされる' do
          visit new_post_path
          expect(current_path).to eq(login_path)
          expect(page).to have_content('ログインしてください')
        end
      end

      context 'ログインしている場合' do
        before do
          login(user)
          visit new_post_path
        end

        it '投稿が作成に成功する' do
          fill_in 'メモ', with: 'test'
          check 'Engineer'
          file_path = Rails.root.join('spec', 'fixtures', '20210227_005224.jpg')
          attach_file 'デスク写真', file_path
          click_button '投稿する'
          expect(current_path).to eq(posts_path)
          expect(page).to have_content('投稿しました')
          within('#new_arrival') do
            expect(page).to have_selector("img[src$='20210227_005224.jpg']")
          end
        end
        it '投稿の作成に失敗する' do
          click_button '投稿する'
          expect(page).to have_content('投稿できません')
          expect(page).to have_content('カテゴリーを一つ以上選択してください')
          expect(page).to have_content('デスク写真をアップロードしてください')
        end
      end
    end

    describe '投稿の詳細' do
      it '投稿の詳細が表示される' do
        visit posts_path
        within "#post-id-#{post.id}" do
          click_on 'post-img'
        end
        expect(current_path).to eq(post_path(post)), '詳細ページに遷移していません'
        expect(page).to have_content(post.user.name), 'ユーザーの名前が表示されていません'
        expect(page).to have_content(post.body), '投稿内容が表示されていません'
      end
    end

    describe '投稿の編集' do
      let(:post_by_user) { create(:post, user: user) }
      let(:post_by_others) { create(:post) }

      context '他人の投稿の場合' do
        it '編集・削除ボタンが表示されない' do
          login(user)
          visit post_path(post_by_others)
          expect(page).not_to have_selector("#button-edit-#{post_by_others.id}")
          expect(page).not_to have_selector("#button-delete-#{post_by_others.id}")
        end
      end
      context '自分の投稿の場合' do
        it '編集・削除ボタンが表示される' do
          login(user)
          visit post_path(post_by_user)
          expect(page).to have_selector("#button-edit-#{post_by_user.id}")
          expect(page).to have_selector("#button-delete-#{post_by_user.id}")
        end
      end
    end
  end
end
