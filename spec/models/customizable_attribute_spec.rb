# == Schema Information
#
# Table name: customizable_attributes
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  order       :integer          default(1)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :integer          not null
#
# Indexes
#
#  index_customizable_attributes_on_product_id  (product_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#
require 'rails_helper'

RSpec.describe CustomizableAttribute, type: :model do
  subject(:customizable_attribute) { build(:customizable_attribute) }

  it { is_expected.to be_valid }

  context 'whit name not present' do
    subject(:customizable_attribute) { build(:customizable_attribute, name: "") }

    it { is_expected.not_to be_valid }
  end

  context 'whit description not present' do
    subject(:customizable_attribute) { build(:customizable_attribute, description: "") }

    it { is_expected.not_to be_valid }
  end

  context 'whit name already taken for the same product' do
    let!(:product) { create(:product) }
    let!(:another_customizable_attribute) { create(:customizable_attribute, name: "Duplicated name", product:) }

    subject(:customizable_attribute) { build(:customizable_attribute, name: "Duplicated name", product:) }

    it { is_expected.not_to be_valid }
  end

  context 'whit the same name but in different products' do
    let!(:product) { create(:product) }
    let!(:another_product) { create(:product) }
    let!(:another_customizable_attribute) { create(:customizable_attribute, name: "Duplicated name", product:) }

    subject(:customizable_attribute) { build(:customizable_attribute, name: "Duplicated name", product: another_product) }

    it { is_expected.to be_valid }
  end

  context 'whit order not present' do
    subject(:attribute_option) { build(:attribute_option, order: nil) }

    it { is_expected.not_to be_valid }
  end

  context 'whit order not being a number' do
    subject(:attribute_option) { build(:attribute_option, order: "NaN") }

    it { is_expected.not_to be_valid }
  end
end
