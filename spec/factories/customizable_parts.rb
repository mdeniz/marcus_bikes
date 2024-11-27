FactoryBot.define do
  factory :customizable_part do
    sequence(:name) { |n| "CustomizablePart #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    order { 1 }
    product
  end
end
