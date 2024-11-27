FactoryBot.define do
  factory :banned_combination do
    source { create(:product) }
    target { create(:product) }
  end
end
