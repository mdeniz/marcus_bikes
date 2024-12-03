# == Schema Information
#
# Table name: price_changes
#
#  id                 :integer          not null, primary key
#  change             :decimal(10, 2)   default(0.0)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  changed_product_id :integer          not null
#  on_product_id      :integer          not null
#
# Indexes
#
#  index_price_changes_on_changed_product_id                    (changed_product_id)
#  index_price_changes_on_changed_product_id_and_on_product_id  (changed_product_id,on_product_id) UNIQUE
#  index_price_changes_on_on_product_id                         (on_product_id)
#
# Foreign Keys
#
#  changed_product_id  (changed_product_id => products.id)
#  on_product_id       (on_product_id => products.id)
#
class PriceChange < ApplicationRecord
  belongs_to :changed_product, class_name: "Product"
  belongs_to :on_product, class_name: "Product"

  validates :changed_product, uniqueness: { scope: :on_product_id }
  validates :change, presence: true, numericality: true
end
