# == Schema Information
#
# Table name: banned_combinations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  source_id  :integer          not null
#  target_id  :integer          not null
#
# Indexes
#
#  index_banned_combinations_on_source_id                (source_id)
#  index_banned_combinations_on_source_id_and_target_id  (source_id,target_id) UNIQUE
#  index_banned_combinations_on_target_id                (target_id)
#
# Foreign Keys
#
#  source_id  (source_id => products.id)
#  target_id  (target_id => products.id)
#
class BannedCombination < ApplicationRecord
  belongs_to :source, class_name: "Product"
  belongs_to :target, class_name: "Product"

  validates :source, uniqueness: { scope: :target_id }
end
