FactoryBot.define do
  factory :deal do
    name { Faker::Commerce.product_name }
    amount { Faker::Commerce.price }
    author

    factory :deal_with_categories do
      transient do
        categories_count { 5 }
      end

      categories do
        Array.new(categories_count) { association(:category) }
      end
    end
  end
end
