class CustomizableAttribute < ApplicationRecord
  belongs_to :product
  has_many :attribute_options, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :product_id }
  validates :description, presence: true
  validates :order, presence: true, numericality: true

  accepts_nested_attributes_for :attribute_options
end
