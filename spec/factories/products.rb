FactoryBot.define do
  factory :product do
    uuid { "Product #{id}" }
    brand { "Brand #{id}" }
    model { "Model #{id}" }
    description { "Description #{id}" }
    price { 9.99 }
    image { "http://example.com/image.jpg" }
    year { 2024 }
    enabled { true }
    stock_available { true }
    customizable { false }
    category { nil }
  end
end
