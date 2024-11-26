class Product < ApplicationRecord
  belongs_to :category

  before_create :generate_uuid

  private

    def generate_uuid
      self.uuid ||= SecureRandom.uuid_v7
    end
end
