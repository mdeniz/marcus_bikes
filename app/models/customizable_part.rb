class CustomizablePart < ApplicationRecord
  belongs_to :product
  has_many :part_options, dependent: :destroy
  has_many :products, through: :part_options

  validates :name, presence: true, uniqueness: { scope: :product_id }
  validates :description, presence: true
end
