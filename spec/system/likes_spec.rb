require 'rails_helper'

RSpec.describe "Likes", type: :system do
  describe "いいね機能" do
    let(:user) { create(:user) }
    let!(:post_by_uesr) { create(:post, user: user) }
    let!(:post_by_others) { create(:post) }
    context "under condition" do
      it "behaves like" do
        
      end
    end
  end
  
end
