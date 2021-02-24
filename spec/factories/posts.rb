FactoryBot.define do
  factory :post do
    sequence(:body) { |n| "test_body_#{n}" }
    association :user
  end

  trait :with_category do
    transient do
      sequence(:category_name) { |n| "test_category_name_#{n}" }
    end
    after(:build) do |post, evaluator|
      post.categories << build(:category, name: evaluator.category_name)
    end
  end
end