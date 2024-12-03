# == Schema Information
#
# Table name: customizable_attributes
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  order       :integer          default(1)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :integer          not null
#
# Indexes
#
#  index_customizable_attributes_on_product_id  (product_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#
class CustomizableAttribute < ApplicationRecord
  belongs_to :product
  has_many :attribute_options, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :product_id }
  validates :description, presence: true
  validates :order, presence: true, numericality: true

  accepts_nested_attributes_for :attribute_options
end
