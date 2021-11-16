FactoryBot.define do
  factory :user, aliases: [:author] do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
