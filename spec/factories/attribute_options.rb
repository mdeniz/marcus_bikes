FactoryBot.define do
  factory :attribute_option do
    sequence(:name) { |n| "AttributeOption #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    order { 1 }
    stock_available { true }
    customizable_attribute
  end
end
