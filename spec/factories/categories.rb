FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    order { 1 }
    parent { nil }
  end
end
