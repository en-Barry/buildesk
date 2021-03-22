require 'rails_helper'

RSpec.describe "Likes", type: :system do
  let(:user) { create(:user) }
  let!(:post_by_uesr) { create(:post, user: user) }
  let!(:post_by_others) { create(:post) }

  describe "いいね機能" do
    context "他人の投稿の場合" do
      it "いいねボタンが表示される" do
        login(user)
        visit post_path(post_by_others)
        expect(page).to have_selector("#button-good-#{post_by_others.id}")  
      end
    end
    context "自分の投稿の場合" do
      it "いいねボタンが表示されない" do
        login(user)
        visit post_path(post_by_uesr)
        expect(page).not_to have_selector("#button-good-#{post_by_uesr.id}")  
      end
    end
    
  end
  
end
