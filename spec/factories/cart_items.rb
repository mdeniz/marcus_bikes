FactoryBot.define do
  factory :cart_item do
    cart
    product
    order { 1 }
    quantity { 1 }
    price { 0 }
  end
end
