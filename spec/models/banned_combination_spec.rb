require 'rails_helper'

RSpec.describe BannedCombination, type: :model do
  subject(:banned_combination) { build(:banned_combination) }

  it { is_expected.to be_valid }

  context 'whit the same source product but different target products' do
    let!(:source) { create(:product) }
    let!(:target) { create(:product) }
    let!(:another_target) { create(:product) }
    let!(:existing_banned_combination) { create(:banned_combination, source:, target:) }

    subject(:banned_combination) { build(:banned_combination, source:, target: another_target) }

    it { is_expected.to be_valid }
  end

  context 'whit the same target product but different source products' do
    let!(:target) { create(:product) }
    let!(:source) { create(:product) }
    let!(:another_source) { create(:product) }
    let!(:existing_banned_combination) { create(:banned_combination, source:, target:) }

    subject(:banned_combination) { build(:banned_combination, source: another_source, target:) }

    it { is_expected.to be_valid }
  end

  context 'whit the same target product and the same source product' do
    let!(:target) { create(:product) }
    let!(:source) { create(:product) }
    let!(:existing_banned_combination) { create(:banned_combination, source:, target:) }

    subject(:banned_combination) { build(:banned_combination, source:, target:) }

    it { is_expected.not_to be_valid }
  end
end
