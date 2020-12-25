FactoryBot.define do
  factory :item do
    name                    { 'テスト' }
    info                    { 'この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。' }
    category_id             { Faker::Number.between(from: 2, to: 11) }
    sales_status_id         { Faker::Number.between(from: 2, to: 7) }
    shopping_fee_status_id  { Faker::Number.between(from: 2, to: 3) }
    prefecture_id           { Faker::Number.between(from: 2, to: 48) }
    scheduled_delivery_id   { Faker::Number.between(from: 2, to: 4) }
    price                   { 500 }
    user_id                 { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
