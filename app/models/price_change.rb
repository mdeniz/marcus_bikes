class PriceChange < ApplicationRecord
  belongs_to :changed_product, class_name: "Product"
  belongs_to :on_product, class_name: "Product"

  validates :changed_product, uniqueness: { scope: :on_product_id }
  validates :on_product, uniqueness: { scope: :changed_product_id }
  validates :change, presence: true, numericality: true
end
