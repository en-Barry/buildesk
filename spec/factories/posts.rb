FactoryBot.define do
  factory :post do
    body { '最新版のデスクです' }
    association :user
  end
end