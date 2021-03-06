FactoryBot.define do
  factory :comment do
    sequence(:body) { |n| "comment_test_#{n}" }
    association :user
    association :post
  end
end