require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let!(:post_with_engineer) { create(:post, :with_engineer) }
  let!(:post_with_writer) { create(:post, :with_writer) }
  let!(:post_with_mediacreator) { create(:post, :with_mediacreator) }

  describe "トップページの表示" do
    context "新着の表示" do
      it '最新の投稿が表示される' do
        visit root_path
        within('.new_arrival') do
          expect(page).to have_selector("#post-id-#{post_with_engineer.id}")
          expect(page).to have_selector("#post-id-#{post_with_writer.id}")
          expect(page).to have_selector("#post-id-#{post_with_mediacreator.id}")
        end
      end
    end
    context "カテゴリ別の表示" do
      it "エンジニアの投稿が表示される" do
        visit root_path
        within('.post_engineer') do
          expect(page).to have_selector("#post-id-#{post_with_engineer.id}")
          expect(page).not_to have_selector("#post-id-#{post_with_writer.id}")
          expect(page).not_to have_selector("#post-id-#{post_with_mediacreator.id}")
        end
      end
      it "ライターの投稿が表示される" do
        visit root_path
        within('.post_writer') do
          expect(page).to have_selector("#post-id-#{post_with_writer.id}")
          expect(page).not_to have_selector("#post-id-#{post_with_engineer.id}")
          expect(page).not_to have_selector("#post-id-#{post_with_mediacreator.id}")
        end
      end
      it "動画系クリエイターの投稿が表示される" do
        visit root_path
        within('.post_mediacreator') do
          expect(page).to have_selector("#post-id-#{post_with_mediacreator.id}")
          expect(page).not_to have_selector("#post-id-#{post_with_engineer.id}")
          expect(page).not_to have_selector("#post-id-#{post_with_writer.id}")
        end
      end
    end
  end

  describe "カテゴリ別一覧の表示" do
    context "全カテゴリ一覧ページ" do
      it "投稿一覧が表示される" do
        visit categories_path
        expect(page).to have_selector("#post-id-#{post_with_engineer.id}")
        expect(page).to have_selector("#post-id-#{post_with_writer.id}")
        expect(page).to have_selector("#post-id-#{post_with_mediacreator.id}")
      end
    end
    context "エンジニアのページ" do
      it "投稿一覧が表示される" do
        visit category_path(post_with_engineer.categories.name)
        expect(page).to have_selector("#post-id-#{post_with_engineer.id}")
        expect(page).not_to have_selector("#post-id-#{post_with_writer.id}")
        expect(page).not_to have_selector("#post-id-#{post_with_mediacreator.id}")
      end
    end
    context "ライターのページ" do
      it "投稿一覧が表示される" do
        visit category_path(post_with_writer.categories.name)
        expect(page).to have_selector("#post-id-#{post_with_writer.id}")
        expect(page).not_to have_selector("#post-id-#{post_with_engineer.id}")
        expect(page).not_to have_selector("#post-id-#{post_with_mediacreator.id}")
      end
    end
    context "動画系クリエイター" do
      it "投稿一覧が表示される" do
        visit category_path(post_with_mediacreator.categories.name)
        expect(page).to have_selector("#post-id-#{post_with_mediacreator.id}")
        expect(page).not_to have_selector("#post-id-#{post_with_engineer.id}")
        expect(page).not_to have_selector("#post-id-#{post_with_writer.id}")
      end
    end
  end
  
end
