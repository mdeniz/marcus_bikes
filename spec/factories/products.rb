FactoryBot.define do
  factory :product do
    uuid { "MyString" }
    brand { "MyString" }
    model { "MyString" }
    description { "MyString" }
    price { "9.99" }
    image { "MyString" }
    year { 1 }
    enabled { false }
    stock_available { false }
    customizable { false }
    category { nil }
  end
end
