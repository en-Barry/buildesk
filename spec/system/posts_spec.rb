require 'rails_helper'

RSpec.describe "Posts", type: :system do
  describe "トップページの表示" do
    let!(:post_with_engineer) { create(:post, :with_engineer) }
    let!(:post_with_writer) { create(:post, :with_writer) }
    let!(:post_with_videocreator) { create(:post, :with_videocreator) }

    context "新着の表示" do
      it '最新の投稿が表示される' do
        visit root_path
        within('.new_arrival') do
          expect(page).to have_content(post_with_engineer.user.name)
          expect(page).to have_content(post_with_writer.user.name)
          expect(page).to have_content(post_with_videocreator.user.name)
        end
      end
    end
    context "カテゴリ別の表示" do
      it "エンジニアの投稿が表示される" do
        visit root_path
        within('.post_engineer') do
          expect(page).to have_content(post_with_engineer.user.name)
        end
      end
      it "ライターの投稿が表示される" do
        visit root_path
        within('.post_writer') do
          expect(page).to have_content(post_with_writer.user.name)
        end
      end
      it "動画系クリエイターの投稿が表示される" do
        visit root_path
        within('.post_videocreator') do
          expect(page).to have_content(post_with_videocreator.user.name)
        end
      end
    end
  end
  describe "カテゴリ別一覧の表示" do
    
  end
  
end
