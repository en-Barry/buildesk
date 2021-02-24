FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "test_name_#{n}" }
  end
end