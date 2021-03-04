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

  trait :with_image do
    after(:build) do |post|
      post.post_images << create(:post_image)
    end
  end

  factory :image_with_engineer, traits: %i[with_engineer with_image]
  factory :image_with_writer, traits: %i[with_writer with_image]
  factory :image_with_mediacreator, traits: %i[with_mediacreator with_image]
end
