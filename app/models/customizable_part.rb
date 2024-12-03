# == Schema Information
#
# Table name: customizable_parts
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
#  index_customizable_parts_on_product_id  (product_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#
class CustomizablePart < ApplicationRecord
  belongs_to :product
  has_many :part_options, dependent: :destroy
  has_many :products, through: :part_options

  validates :name, presence: true, uniqueness: { scope: :product_id }
  validates :description, presence: true
  validates :order, presence: true, numericality: true
end
