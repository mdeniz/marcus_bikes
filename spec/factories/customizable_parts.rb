FactoryBot.define do
  factory :customizable_part do
    name { "Customizable Part #{id}" }
    description { "Description #{id}" }
    order { 1 }
    product { nil }
  end
end
