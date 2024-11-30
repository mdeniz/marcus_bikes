class AttributeOption < ApplicationRecord
  belongs_to :customizable_attribute

  validates :name, presence: true, uniqueness: { scope: :customizable_attribute_id }
  validates :description, presence: true
  validates :order, presence: true, numericality: true
end
