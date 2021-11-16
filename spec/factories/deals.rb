FactoryBot.define do
  factory :deal do
    name { Faker::Commerce.product_name }
    amount { Faker::Commerce.price }
    author
  end
end
