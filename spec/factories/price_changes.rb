FactoryBot.define do
  factory :price_change do
    changed_product { create(:product) }
    on_product { create(:product) }
  end
end
