FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_#{n}" }
    sequence(:email) { |n| "test_#{n}@example.com" }
    sequence(:description) { |n| "description_#{n}" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/sample.jpg'), 'image/png') }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
