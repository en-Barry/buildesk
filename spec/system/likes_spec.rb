require 'rails_helper'

RSpec.describe "Likes", type: :system do
  let(:user) { create(:user) }
  let!(:post_by_uesr) { create(:post, user: user) }
  let!(:post_by_others) { create(:post) }
  let!(:post_by_others_and_liked) { create(:post) }
  let!(:like) { create(:like, post: post_by_others_and_liked, user: user) }

  before do
    driven_by(:rack_test)
  end

  describe "いいねのCRUD" do

    describe "いいねボタンの表示" do
      context "他人の投稿かつ、いいねしていない場合" do
        it "いいねボタンが表示される" do
          login(user)
          visit post_path(post_by_others)
          expect(page).to have_selector("#button-like-#{post_by_others.id}"), 'いいねボタンが表示されていません'
          expect(page).to have_selector(".far.fa-heart"), 'いいねボタンが正しく表示されていません' 
        end
      end
      context "他人の投稿かつ、いいねしている場合" do
        it "いいねボタンが表示される" do
          login(user)
          visit post_path(post_by_others_and_liked)
          expect(page).to have_selector("#button-like-#{post_by_others_and_liked.id}"), 'いいね済みボタンが表示されていません'
          expect(page).to have_selector(".fas.fa-heart"), 'いいね済みボタンが正しく表示されていません'
        end
      end
      context "自分の投稿の場合" do
        it "いいねボタンが表示されない" do
          login(user)
          visit post_path(post_by_uesr)
          expect(page).not_to have_selector("#button-like-#{post_by_uesr.id}")  
        end
      end
    end
    
    describe "いいねの作成" do
      context "ログインしていない場合" do
        it "ログインページに遷移する" do
          visit post_path(post_by_others)
          click_on "button-like-#{post_by_others.id}"
          expect(current_path).to eq(login_path), 'ログインページにリダイレクトされていません'
        end
      end
      context "ログインしている場合" do
        it 'いいねが作成できる' do
          login(user)
          visit post_path(post_by_others)
          expect(page).to have_selector('.far.fa-heart'), 'いいねボタンが表示されていません'
          click_on "button-like-#{post_by_others.id}"
          expect(current_path).to eq(post_path(post_by_others.id)), '投稿詳細ページに遷移していません'
          expect(page).to have_selector('.fas.fa-heart'), 'いいね済みになっていません'
        end
      end
    end

    describe "いいねの削除" do
      context "ログインしていない場合" do
        it "ログインページにリダイレクトされる" do
          visit post_path(post_by_others_and_liked)
          click_on "button-like-#{post_by_others_and_liked.id}"
          expect(current_path).to eq(login_path), 'ログインページにリダイレクトされていません'
        end
      end
      context "ログインしている場合" do
        it "いいねを取り消せる" do
          login(user)
          visit post_path(post_by_others_and_liked)
          expect(page).to have_selector('.fas.fa-heart'), 'いいね済みボタンが表示されていません'
          click_on "button-like-#{post_by_others_and_liked.id}"
          expect(current_path).to eq(post_path(post_by_others_and_liked.id)), '投稿詳細ページに遷移していません'
          expect(page).to have_selector('.far.fa-heart'), 'いいねボタンに変化していません'  
        end
      end
    end
  end
end
