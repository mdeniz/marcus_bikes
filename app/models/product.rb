class Product < ApplicationRecord
  # Categories
  belongs_to :category

  # Custom attributes
  has_many :customizable_attributes, dependent: :destroy
  has_many :attibute_options, through: :customizable_attributes

  # Custom parts
  has_many :customizable_parts, dependent: :destroy
  has_many :selectable_products, class_name: "Product", through: :customizable_parts, source: :products
  has_many :part_options, dependent: :destroy

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
  validates :standalone_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def incompatible_products
    (incompatible_products_as_source + incompatible_products_as_target).uniq
  end

  def incompatible_products_ids
    (incompatible_products_as_source_ids + incompatible_products_as_target_ids).uniq
  end

  def selection_price(selected_products_ids = [])
    price_changes = PriceChange.where(changed_product_id: selected_products_ids)

    result = Product.where(id: selected_products_ids).sum(:standalone_price)
    price_changes.each do |price_change|
      result += price_change.change if selected_products_ids.include?(price_change.on_product_id)
    end
    result
  end

  private

    def generate_uuid
      self.uuid ||= SecureRandom.uuid_v7
    end
end
