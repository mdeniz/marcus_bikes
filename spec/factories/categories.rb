FactoryBot.define do
  factory :category do
    name { "Category #{id}" }
    description { "Description #{id}" }
    order { 1 }
    category { nil }
  end
end
