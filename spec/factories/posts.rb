FactoryBot.define do
  factory :post do
    sequence(:body) { |n| "test_body_#{n}" }
    association :user
  end

  trait :with_engineer do
    after(:create) do |post|
      create(:post_category, post: post, category: create(:category, :engineer))
    end
  end

  trait :with_writer do
    after(:create) do |post|
      create(:post_category, post: post, category: create(:category, :writer))
    end
  end

  trait :with_videocreator do
    after(:create) do |post|
      create(:post_category, post: post, category: create(:category, :video_creator))
    end
  end
end