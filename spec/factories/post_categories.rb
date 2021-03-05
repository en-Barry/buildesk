FactoryBot.define do
  factory :post_category do
    association :category
    association :post
  end
end
