require 'rails_helper'

RSpec.describe "Posts", type: :system do
  describe "トップページの表示" do
    let!(:post1) { create(:post) }
    let!(:post2) { create(:post) }
    let!(:post3) { create(:post) }
    let!(:category_engineer) { create(:category, :engineer) }
    let!(:category_writer) { create(:category, :writer) }
    let!(:category_videocreator) { create(:category, :video_creator) }
    let!(:post_engineer) { create(:post_category, post: post1, category: category_engineer) }
    let!(:post_writer) { create(:post_category, post: post2, category: category_writer) }
    let!(:post_videocreator) { create(:post_category, post: post3, category: category_videocreator) }

    context "新着の表示" do
      it '最新の投稿が表示される' do
        visit root_path
        within('.new_arrival') do
          expect(page).to have_content(post_engineer.post.user.name)
          expect(page).to have_content(post_writer.post.user.name)
          expect(page).to have_content(post_videocreator.post.user.name)
        end
      end
    end
    context "カテゴリ別の表示" do
      it "エンジニアの投稿が表示される" do
        visit root_path
        within('.post_engineer') do
          expect(page).to have_content(post_engineer.post.user.name)
        end
      end
      it "ライターの投稿が表示される" do
        visit root_path
        within('.post_writer') do
          expect(page).to have_content(post_writer.post.user.name)
        end
      end
      it "動画系クリエイターの投稿が表示される" do
        visit root_path
        within('.post_videocreator') do
          expect(page).to have_content(post_videocreator.post.user.name)
        end
      end
    end
  end
  
end
