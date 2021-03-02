require 'rails_helper'

RSpec.describe Post, type: :model do
  include CarrierWave::Test::Matchers

  context '全てのフィールドが有効な場合' do
    it '有効である' do
      post = build(:post, :with_engineer)
      expect(post).to be_valid
    end
  end
  context 'カテゴリーが選択されていない場合' do
    it '無効である' do
      post = build(:post)
      expect(post).to be_invalid
    end
  end

  context '画像が正しく添付される' do
    it "アップロードに成功する" do
      post = build(:post)
      post_image = build(:post_image)
      expect(post_image).to be_valid
    end
  end
     
  context '画像が許されていない拡張子でアップロードされる' do
    it "アップロードに失敗する" do
      post = build(:post)
      post_image = build(:post_image)
      image_path = File.join(Rails.root, "spec/fixtures/20210227_005224.rb")
      post_image = build(:post_image, image: File.open(image_path))
      expect(post_image).not_to be_valid
    end
  end
end
