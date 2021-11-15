FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { Faker::Internet.email }
  end
end
