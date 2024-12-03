# == Schema Information
#
# Table name: customizable_parts
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  order       :integer          default(1)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :integer          not null
#
# Indexes
#
#  index_customizable_parts_on_product_id  (product_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#
FactoryBot.define do
  factory :customizable_part do
    sequence(:name) { |n| "CustomizablePart #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    order { 1 }
    product
  end
end
