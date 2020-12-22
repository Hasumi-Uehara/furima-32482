FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { 'test1234TEST' }
    password_confirmation { password }
    nickname              { 'ポムポムプリン' }
    first_name            { 'プリン' }
    last_name             { 'ポムポム' }
    first_name_reading    { 'プリン' }
    last_name_reading     { 'ポムポム' }
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 90) }
  end
end
