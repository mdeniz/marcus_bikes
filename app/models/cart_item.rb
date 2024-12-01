class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  serialize :customization, coder: JSON

  validates :order, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true
  validates :price, presence: true, numericality: true
end
