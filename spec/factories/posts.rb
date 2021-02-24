FactoryBot.define do
  factory :post do
    sequence(:body) { |n| "test_body_#{n}" }
    association :user
  end
end