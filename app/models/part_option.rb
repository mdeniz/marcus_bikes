class PartOption < ApplicationRecord
  belongs_to :product
  belongs_to :customizable_part

  validates :product, uniqueness: { scope: :customizable_part_id }
end
