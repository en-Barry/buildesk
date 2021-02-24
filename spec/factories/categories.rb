FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "test_name_#{n}" }
  end

  trait :engineer do
    name { 'Engineer' }
  end

  trait :writer do
    name { 'Writer' }
  end

  trait :video_creator do
    name { 'Video Creator' }
  end
end