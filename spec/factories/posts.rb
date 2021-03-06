FactoryBot.define do
  factory :post do
    sequence(:body) { |n| "test_body_#{n}" }
    association :user

    after(:build) do |post|
      post.post_images << build(:post_image, post: post)
    end

    after(:build) do |post|
      post.categories << create(:category)
    end
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

  factory :post_image do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/20210227_005224.jpg"), 'image/png') }
    sequence(:caption) { |n| "test_caption_#{n}" }
  end
end
