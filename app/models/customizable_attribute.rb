class CustomizableAttribute < ApplicationRecord
  belongs_to :product
  has_many :attibute_options, class_name: "AttributeOption", dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :product_id }
  validates :description, presence: true
  validates :order, presence: true, numericality: true
end