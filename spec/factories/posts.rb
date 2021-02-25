FactoryBot.define do
  factory :post do
    sequence(:body) { |n| "test_body_#{n}" }
    association :user
  end

  trait :with_engineer do
    after(:build) do |post|
      post.categories << create(:category, :engineer)
    end
  end

  trait :with_writer do
    after(:build) do |post|
      post.categories << create(:category, :writer)
    end
  end

  trait :with_mediacreator do
    after(:build) do |post|
      post.categories << create(:category, :media_creator)
    end
  end
end