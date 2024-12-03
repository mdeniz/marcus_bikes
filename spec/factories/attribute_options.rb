# == Schema Information
#
# Table name: attribute_options
#
#  id                        :integer          not null, primary key
#  description               :string
#  name                      :string
#  order                     :integer          default(1)
#  price_change              :decimal(10, 2)   default(0.0)
#  stock_available           :boolean          default(FALSE)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  customizable_attribute_id :integer          not null
#
# Indexes
#
#  index_attribute_options_on_customizable_attribute_id  (customizable_attribute_id)
#
# Foreign Keys
#
#  customizable_attribute_id  (customizable_attribute_id => customizable_attributes.id)
#
FactoryBot.define do
  factory :attribute_option do
    sequence(:name) { |n| "AttributeOption #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    order { 1 }
    stock_available { true }
    customizable_attribute
  end
end
