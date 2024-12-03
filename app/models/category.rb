# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  order       :integer          default(1)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  parent_id   :integer
#
# Indexes
#
#  index_categories_on_parent_id  (parent_id)
#
# Foreign Keys
#
#  parent_id  (parent_id => categories.id)
#
class Category < ApplicationRecord
  extend ActsAsTree::TreeWalker

  acts_as_tree order: :order

  belongs_to :category, class_name: "Category", foreign_key: :parent_id, required: false
  has_many :products

  validates :name, presence: true, uniqueness: { scope: :parent_id }
  validates :description, presence: true
end
