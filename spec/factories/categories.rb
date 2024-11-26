FactoryBot.define do
  factory :category do
    name { "MyString" }
    description { "MyString" }
    order { 1 }
    category { nil }
  end
end
