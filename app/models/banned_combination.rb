class BannedCombination < ApplicationRecord
  belongs_to :source, class_name: "Product"
  belongs_to :target, class_name: "Product"

  validates :source, uniqueness: { scope: :target_id }
end
