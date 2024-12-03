# == Schema Information
#
# Table name: cart_items
#
#  id            :integer          not null, primary key
#  customization :text
#  price         :decimal(10, 2)   default(0.0)
#  quantity      :integer          default(1)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  cart_id       :integer          not null
#  product_id    :integer          not null
#
# Indexes
#
#  index_cart_items_on_cart_id     (cart_id)
#  index_cart_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  cart_id     (cart_id => carts.id)
#  product_id  (product_id => products.id)
#
FactoryBot.define do
  factory :cart_item do
    cart
    product
    order { 1 }
    quantity { 1 }
    price { 0 }
  end
end
