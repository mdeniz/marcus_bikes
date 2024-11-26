class CustomizablePart < ApplicationRecord
  belongs_to :product

  validates :name, presence: true, uniqueness: { scope: :product_id }
  validates :description, presence: true
end
