# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  base_price      :decimal(10, 2)
#  brand           :string
#  customizable    :boolean          default(FALSE)
#  description     :string
#  enabled         :boolean          default(FALSE)
#  image           :string
#  model           :string
#  stock_available :boolean          default(FALSE)
#  uuid            :string
#  year            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer          not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#  unique_uuid_on_products        (uuid) UNIQUE
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#
class Product < ApplicationRecord
  # Categories
  belongs_to :category

  # Custom attributes
  has_many :customizable_attributes, dependent: :destroy
  has_many :attribute_options, through: :customizable_attributes

  # Custom parts
  has_many :customizable_parts, dependent: :destroy
  has_many :part_options, through: :customizable_parts
  has_many :selectable_products, class_name: "Product", through: :customizable_parts, source: :products

  # Banned combinations
  has_many :banned_combinations_as_source, class_name: "BannedCombination", foreign_key: :source_id
  has_many :banned_combinations_as_target, class_name: "BannedCombination", foreign_key: :target_id
  has_many :incompatible_products_as_source, class_name: "Product", through: :banned_combinations_as_source, source: :target
  has_many :incompatible_products_as_target, class_name: "Product", through: :banned_combinations_as_target, source: :source

  # Price changes
  has_many :price_changes, foreign_key: :changed_product_id

  scope :in_catalog, -> { where(enabled: true) }

  before_create :generate_uuid

  validates :brand, presence: true
  validates :model, presence: true
  validates :description, presence: true
  validates :base_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  accepts_nested_attributes_for :customizable_attributes

  # Incompatibilities
  def incompatible_products
    (incompatible_products_as_source + incompatible_products_as_target).uniq
  end

  def incompatible_products_ids
    (incompatible_products_as_source_ids + incompatible_products_as_target_ids).uniq
  end

  # Pricing
  # selected_attribute_option_ids: must contain all the selected attributes of this product and all the selected attributes of the parts
  # selected_part_option_ids: must contain all the seletected parts
  def price(selected_attribute_option_ids:, selected_part_option_ids:)
    base_price +
      selected_attribute_options_price(selected_attribute_option_ids) +
      selected_part_options_price(selected_part_option_ids)
  end

  private

    def selected_attribute_options_price(selected_attribute_option_ids)
      AttributeOption.where(id: selected_attribute_option_ids).sum(:price_change)
    end

    def selected_part_options_price(selected_part_option_ids)
      price_changes = PriceChange.where(changed_product_id: selected_part_option_ids)

      result = Product.where(id: selected_part_option_ids - [ id ]).sum(:base_price)
      price_changes.each do |price_change|
        result += price_change.change if selected_part_option_ids.include?(price_change.on_product_id)
      end
      result
    end

    def generate_uuid
      self.uuid ||= SecureRandom.uuid_v7
    end
end
