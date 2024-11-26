class Category < ApplicationRecord
  extend ActsAsTree::TreeWalker

  acts_as_tree order: :order

  has_many :products

  validates :name, presence: true, uniqueness: { scope: :parent_id }
  validates :description, presence: true
end
