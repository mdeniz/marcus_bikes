class Category < ApplicationRecord
  extend ActsAsTree::TreeWalker

  acts_as_tree order: :order

  has_many :products
end
