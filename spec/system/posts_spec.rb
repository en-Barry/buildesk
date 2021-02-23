require 'rails_helper'

RSpec.describe "Posts", type: :system do
  describe "トップページの表示" do
    context "新着の表示" do
      it '最新の投稿が3件表示される' do
        posts = create_list(:post, 5)
        expect(page).to have_selector()  
      end
    end
    context "カテゴリ別の表示" do
      it "カテゴリごとに3件ずつ表示される" do
        
      end
    end
  end
  
end
