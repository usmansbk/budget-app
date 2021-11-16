FactoryBot.define do
  factory :user, aliases: [:author] do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { 'password' }

    factory :user_with_categories do
      transient do
        categories_count { 5 }
      end

      categories do
        Array.new(categories_count) { association(:category) }
      end

      factory :user_with_deals do
        transient do
          deals_count { 5 }
        end

        deals do
          Array.new(deals_count) { association(:deal) }
        end
      end
    end
  end
end
