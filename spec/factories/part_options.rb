# == Schema Information
#
# Table name: part_options
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  customizable_part_id :integer          not null
#  product_id           :integer          not null
#
# Indexes
#
#  index_part_options_on_customizable_part_id                 (customizable_part_id)
#  index_part_options_on_product_id                           (product_id)
#  index_part_options_on_product_id_and_customizable_part_id  (product_id,customizable_part_id) UNIQUE
#
# Foreign Keys
#
#  customizable_part_id  (customizable_part_id => customizable_parts.id)
#  product_id            (product_id => products.id)
#
FactoryBot.define do
  factory :part_option do
    product
    customizable_part
  end
end
