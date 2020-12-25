FactoryBot.define do
  factory :user_order do
    postal_code       {"123-4567"}
    prefecture_id   {18}
    city            {"横浜市緑区"}
    addresses       {"青山１−１−１"}
    building        {"柳ビル１０３"}
    phone_number    {"09012345678"}
  end
end
