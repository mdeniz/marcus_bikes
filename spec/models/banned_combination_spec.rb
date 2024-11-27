require 'rails_helper'

RSpec.describe BannedCombination, type: :model do
  subject(:banned_combination) { build(:banned_combination) }

  it { is_expected.to be_valid }

  context 'whit the same source product but different target products' do
    let!(:source_product) { create(:product) }
    let!(:target_product) { create(:product) }
    let!(:another_target_product) { create(:product) }
    let!(:existing_banned_combination) { create(:banned_combination, source: source_product, target: target_product) }

    subject(:banned_combination) { build(:banned_combination, source: source_product, target: another_target_product) }

    it { is_expected.to be_valid }
  end

  context 'whit the same target product but different source products' do
    let!(:target_product) { create(:product) }
    let!(:source_product) { create(:product) }
    let!(:another_source_product) { create(:product) }
    let!(:existing_banned_combination) { create(:banned_combination, source: source_product, target: target_product) }

    subject(:banned_combination) { build(:banned_combination, source: another_source_product, target: target_product) }

    it { is_expected.to be_valid }
  end

  context 'whit the same target product and the same source product' do
    let!(:target_product) { create(:product) }
    let!(:source_product) { create(:product) }
    let!(:existing_banned_combination) { create(:banned_combination, source: source_product, target: target_product) }

    subject(:banned_combination) { build(:banned_combination, source: source_product, target: target_product) }

    it { is_expected.not_to be_valid }
  end
end
