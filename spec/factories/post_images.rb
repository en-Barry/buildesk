FactoryBot.define do
  factory :post_image do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/20210227_005224.jpg')) }
    sequence(:caption) { |n| "test_caption_#{n}" }
    association :post
  end
end