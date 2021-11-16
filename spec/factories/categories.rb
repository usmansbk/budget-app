FactoryBot.define do
  factory :category do
    name { Faker::Company.name }
    icon { Faker::Company.logo }
  end
end
