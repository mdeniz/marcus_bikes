class BannedCombination < ApplicationRecord
  belongs_to :source, class: Product
  belongs_to :destination, class: Product

  validates :source, uniqueness: { scope: :destination }
end
