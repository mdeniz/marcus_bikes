class Product < ApplicationRecord
  belongs_to :category
  has_many :customizable_parts, dependent: :destroy

  before_create :generate_uuid

  validates :brand, presence: true
  validates :model, presence: true
  validates :description, presence: true
  validates :price, presence: true, comparison: { greater_than_or_equal_to: 0 }

  private

    def generate_uuid
      self.uuid ||= SecureRandom.uuid_v7
    end
end
