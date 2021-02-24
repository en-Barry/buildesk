require 'rails_helper'

RSpec.describe "Posts", type: :system do
  describe "トップページの表示" do
    let(:post_with_category) { create(:post, :with_category, category_name: 'Engineer') }

    context "新着の表示" do
      it '最新の投稿が表示される' do
        visit root_path
        expect(page).to have_selector("img[src$='20210209_020213.jpg']") 
      end
    end
    context "カテゴリ別の表示" do
      it "カテゴリごとに3件ずつ表示される" do
        
      end
    end
  end
  
end
