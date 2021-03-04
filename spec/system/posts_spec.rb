require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe '投稿のCRUD' do
    let!(:post_with_engineer) { create(:post, :with_engineer, :with_image) }
    let!(:post_with_writer) { create(:post, :with_writer, :with_image) }
    let!(:post_with_mediacreator) { create(:post, :with_mediacreator, :with_image) }

    describe 'トップページの表示' do
      context '新着の表示' do
        it '最新の投稿が表示される' do
          visit root_path
          within('.new_arrival') do
            expect(page).to have_selector("#post-id-#{post_with_engineer.id}")
            expect(page).to have_selector("#post-id-#{post_with_writer.id}")
            expect(page).to have_selector("#post-id-#{post_with_mediacreator.id}")
          end
        end
      end
      context 'カテゴリ別の表示' do
        it 'エンジニアの投稿が表示される' do
          visit root_path
          within('.post_engineer') do
            expect(page).to have_selector("#post-id-#{post_with_engineer.id}")
            expect(page).not_to have_selector("#post-id-#{post_with_writer.id}")
            expect(page).not_to have_selector("#post-id-#{post_with_mediacreator.id}")
          end
        end
        it 'ライターの投稿が表示される' do
          visit root_path
          within('.post_writer') do
            expect(page).to have_selector("#post-id-#{post_with_writer.id}")
            expect(page).not_to have_selector("#post-id-#{post_with_engineer.id}")
            expect(page).not_to have_selector("#post-id-#{post_with_mediacreator.id}")
          end
        end
        it '動画系クリエイターの投稿が表示される' do
          visit root_path
          within('.post_mediacreator') do
            expect(page).to have_selector("#post-id-#{post_with_mediacreator.id}")
            expect(page).not_to have_selector("#post-id-#{post_with_engineer.id}")
            expect(page).not_to have_selector("#post-id-#{post_with_writer.id}")
          end
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
      let(:user) { create(:user) }

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

        it '投稿が作成できる' do
          fill_in '本文', with: 'my-desk'
          check 'Engineer'
          file_path = Rails.root.join('spec', 'fixtures', '20210227_005224.jpg')
          attach_file '写真', file_path
          click_button '投稿する'
          expect(current_path).to eq(posts_path)
          expect(page).to have_content('投稿しました')
          within('.new_arrival') do
            expect(page).to have_content(user.name)
          end
        end
        it '投稿の作成に失敗する' do
          file_path = Rails.root.join('spec', 'fixtures', '20210227_005224.txt')
          attach_file '写真', file_path
          click_button '投稿する'
          expect(page).to have_content('投稿できません')
          expect(page).to have_content('カテゴリーを一つ以上選択してください')
        end
      end
    end
  end
end
