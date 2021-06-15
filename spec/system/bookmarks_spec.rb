require 'rails_helper'

RSpec.describe 'Bookmarks', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }
  let!(:post_by_uesr) { create(:post, user: user) }
  let!(:post_by_others) { create(:post) }
  let!(:post_by_others_and_bookmarked) { create(:post) }
  let!(:bookmark) { create(:bookmark, post: post_by_others_and_bookmarked, user: user) }

  describe 'ブックマークのCRUD' do
    describe 'ブックマークボタンの表示' do
      context '他人の投稿かつ、ブックマークしていない場合' do
        it 'ブックマークボタンが表示される' do
          login(user)
          visit post_path(post_by_others)
          expect(page).to have_selector("#button-bookmark-#{post_by_others.id}"), 'ブックマークボタンが表示されていません'
          expect(page).to have_selector('.far.fa-bookmark'), 'ブックマークボタンが正しく表示されていません'
        end
      end
      context '他人の投稿かつ、ブックマークしている場合' do
        it 'ブックマークボタンが表示される' do
          login(user)
          visit post_path(post_by_others_and_bookmarked)
          expect(page).to have_selector("#button-bookmark-#{post_by_others_and_bookmarked.id}"), 'ブックマーク済みボタンが表示されていません'
          expect(page).to have_selector('.fas.fa-bookmark'), 'ブックマーク済みボタンが正しく表示されていません'
        end
      end
    end

    describe 'ブックマークした投稿の一覧表示' do
      context 'ログインしていない場合' do
        it 'ログインページにリダイレクトされる' do
          visit bookmarks_posts_path
          expect(current_path).to eq(login_path), 'ログインページにリダイレクトされていません'
        end
      end

      context 'ログインしてる場合' do
        it 'ブックマークした投稿が表示される' do
          login(user)
          visit bookmarks_posts_path
          expect(page).to have_selector("#post-id-#{post_by_others_and_bookmarked.id}"), 'ブックマークした投稿が表示されていません'
          expect(page).not_to have_selector("#post-id-#{post_by_others.id}"), 'ブックマークしていない投稿が表示されています'
        end
      end
    end

    describe 'ブックマークの作成' do
      context 'ログインしていない場合' do
        it 'ログインページに遷移する' do
          visit post_path(post_by_others)
          click_on "button-bookmark-#{post_by_others.id}"
          expect(current_path).to eq(login_path), 'ログインページにリダイレクトされていません'
        end
      end
      context 'ログインしている場合' do
        it 'ブックマークが作成できる' do
          login(user)
          visit post_path(post_by_others)
          expect(page).to have_selector('.far.fa-bookmark'), 'ブックマークボタンが表示されていません'
          click_on "button-bookmark-#{post_by_others.id}"
          expect(current_path).to eq(post_path(post_by_others.id)), '投稿詳細ページに遷移していません'
          expect(page).to have_selector('.fas.fa-bookmark'), 'ブックマーク済みになっていません'
        end
      end
    end

    describe 'ブックマークの削除' do
      context 'ログインしていない場合' do
        it 'ログインページにリダイレクトされる' do
          visit post_path(post_by_others_and_bookmarked)
          click_on "button-bookmark-#{post_by_others_and_bookmarked.id}"
          expect(current_path).to eq(login_path), 'ログインページにリダイレクトされていません'
        end
      end
      context 'ログインしている場合' do
        it 'ブックマークを取り消せる' do
          login(user)
          visit post_path(post_by_others_and_bookmarked)
          expect(page).to have_selector('.fas.fa-bookmark'), 'ブックマーク済みボタンが表示されていません'
          click_on "button-bookmark-#{post_by_others_and_bookmarked.id}"
          expect(current_path).to eq(post_path(post_by_others_and_bookmarked.id)), '投稿詳細ページに遷移していません'
          expect(page).to have_selector('.far.fa-bookmark'), 'ブックマークボタンに変化していません'
        end
      end
    end
  end
end
