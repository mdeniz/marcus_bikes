class BannedCombination < ApplicationRecord
  belongs_to :source, class_name: "Product"
  belongs_to :destination, class_name: "Product"

  validates :source, uniqueness: { scope: :destination_id }
end
