# == Schema Information
#
# Table name: part_options
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  customizable_part_id :integer          not null
#  product_id           :integer          not null
#
# Indexes
#
#  index_part_options_on_customizable_part_id                 (customizable_part_id)
#  index_part_options_on_product_id                           (product_id)
#  index_part_options_on_product_id_and_customizable_part_id  (product_id,customizable_part_id) UNIQUE
#
# Foreign Keys
#
#  customizable_part_id  (customizable_part_id => customizable_parts.id)
#  product_id            (product_id => products.id)
#
require 'rails_helper'

RSpec.describe PartOption, type: :model do
  subject(:part_option) { build(:part_option) }

  it { is_expected.to be_valid }

  context 'whit the same product but different customizable parts' do
    let!(:product) { create(:product) }
    let!(:customizable_part) { create(:customizable_part) }
    let!(:another_customizable_part) { create(:customizable_part) }
    let!(:existing_part_option) { create(:part_option, product:, customizable_part:) }

    subject(:part_option) { build(:part_option, product:, customizable_part: another_customizable_part) }

    it { is_expected.to be_valid }
  end

  context 'whit the same customizable parts but different products' do
    let!(:customizable_part) { create(:customizable_part) }
    let!(:product) { create(:product) }
    let!(:another_product) { create(:product) }
    let!(:existing_part_option) { create(:part_option, product:, customizable_part:) }

    subject(:part_option) { build(:part_option, product: another_product, customizable_part:) }

    it { is_expected.to be_valid }
  end

  context 'whit the same customizable part and the same product' do
    let!(:customizable_part) { create(:customizable_part) }
    let!(:product) { create(:product) }
    let!(:existing_part_option) { create(:part_option, product:, customizable_part:) }

    subject(:part_option) { build(:part_option, product:, customizable_part:) }

    it { is_expected.not_to be_valid }
  end
end
