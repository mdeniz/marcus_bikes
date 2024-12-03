# == Schema Information
#
# Table name: customizable_attributes
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
#  index_customizable_attributes_on_product_id  (product_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#
FactoryBot.define do
  factory :customizable_attribute do
    sequence(:name) { |n| "CustomizableAttribute #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    order { 1 }
    product
  end
end
