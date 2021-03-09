require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:me) { create(:user) }
  let!(:post) { create(:post) }
  let!(:comment_by_me) { create(:comment, user: me, post: post) }
  let!(:comment_by_another) { create(:comment, post: post) }
  let!(:post_with_engineer) { create(:post, :with_engineer) }
  let!(:post_with_writer) { create(:post, :with_writer) }
  let!(:post_with_mediacreator) { create(:post, :with_mediacreator) }

  describe "コメントのCRUD" do
    before do
      login(me)
      visit post_path(post)
    end

    describe "コメントの一覧" do
      context "投稿詳細ページにアクセス" do
        it "投稿に紐づくコメントが表示される" do
          within('#js-post-comment') do
            expect(page).to have_content(comment_by_me.body)
            expect(page).to have_content(comment_by_another.user.name)  
          end
        end
      end
    end
    
    describe "コメントの作成" do
      context "コメントを入力して作成" do
        it "作成に成功する" do
          fill_in 'コメント', with: 'test'
          click_on '投稿'
          comment = Comment.last
          within('#js-post-comment') do
            expect(page).to have_content(comment.user.name)
            expect(page).to have_content(comment.body)
          end
        end
      end

      context "コメントを未入力で作成" do
        it "作成に失敗する" do
          fill_in 'コメント', with: ''
          click_on '投稿'
          expect(page).to have_content('コメントを作成できませんでした') 
        end
      end
    end
    
    describe "コメントの編集" do
      context "他人のコメントの場合" do
        it "編集ボタンと削除ボタンが表示されない" do
          within("#comment-#{comment_by_another.id}") do
            expect(page).not_to have_selector('.js-edit-comment-button')
            expect(page).not_to have_selector('.js-delete-comment-button')
          end
        end
      end
    end
  end
end
