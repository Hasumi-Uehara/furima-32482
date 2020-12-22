FactoryBot.define do
  factory :item do
    image                   { Faker::LoremPixel.image }
    name                    { Faker::Lorem.characters(40) }
    info                    { Faker::Lorem.characters(1000) }
    category_id             { Faker::Number.between(from: 1, to: 11) }
    sales_status_id         { Faker::Number.between(from: 1, to: 7) }
    shopping_fee_status_id  { Faker::Number.between(from: 1, to: 3) }
    prefecture_id           { Faker::Number.between(from: 1, to: 48) }
    scheduled_delivery_id   { Faker::Number.between(from: 1, to: 4) }
    price                   { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end
