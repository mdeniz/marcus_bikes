FactoryBot.define do
  factory :product do
    uuid { SecureRandom.uuid_v7 }
    sequence(:brand) { |n| "Brand #{n}" }
    sequence(:model) { |n| "Model #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    base_price { 9.99 }
    image { "http://example.com/image.jpg" }
    year { 2024 }
    enabled { true }
    stock_available { true }
    customizable { false }
    category
  end
end
