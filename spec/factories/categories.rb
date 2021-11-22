FactoryBot.define do
  factory :category do
    name { Faker::Company.name }
    icon { Faker::Company.logo }
    user

    factory :category_with_deals do
      transient do
        deals_count { 5 }
      end

      deals do
        Array.new(deals_count) { association(:deal) }
      end
    end
  end
end
