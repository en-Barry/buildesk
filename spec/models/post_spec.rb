require 'rails_helper'

RSpec.describe Post, type: :model do
  context '全てのフィールドが有効な場合' do
    let!(:post) { create(:post, :with_engineer ) }
    it '有効である' do
      expect(post).to be_valid
    end
  end
  context 'bodyが65535字以内入力された場合' do
    let!(:post) { create(:post, :with_engineer, body: 'a' * 65_535) }
    it '有効である' do
      expect(post).to be_valid
    end
  end
  context 'bodyが65536字以上入力された場合' do
    it '無効である' do
      post = build(:post, :with_engineer, body: 'a' * 65_536)
      expect(post).to be_invalid
    end
  end
  context "カテゴリーが選択されていない場合" do
    it '無効である' do
      post = build(:post)
      expect(post).to be_invalid
    end
  end
  
end
