FactoryBot.define do
  factory :customizable_attribute do
    sequence(:name) { |n| "CustomizableAttribute #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    order { 1 }
    product
  end
end
