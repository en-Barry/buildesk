require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "全てのフィールドが有効な場合" do
    it '有効である' do
      comment = build(:comment)
      expect(comment).to be_valid
    end
  end
  context "bodyが未入力の場合" do
    it '無効である' do
      comment = build(:comment, body: nil)
      expect(comment).to be_invalid
    end
  end
end
