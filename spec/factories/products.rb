# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  base_price      :decimal(10, 2)
#  brand           :string
#  customizable    :boolean          default(FALSE)
#  description     :string
#  enabled         :boolean          default(FALSE)
#  image           :string
#  model           :string
#  stock_available :boolean          default(FALSE)
#  uuid            :string
#  year            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer          not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#  unique_uuid_on_products        (uuid) UNIQUE
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#
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
