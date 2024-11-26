FactoryBot.define do
  factory :customizable_part do
    name { "MyString" }
    description { "MyString" }
    order { 1 }
    product { nil }
  end
end
