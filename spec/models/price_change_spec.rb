require 'rails_helper'

RSpec.describe PriceChange, type: :model do
  subject(:price_change) { build(:price_change) }

  it { is_expected.to be_valid }

  context 'whit change not present' do
    subject(:price_change) { build(:price_change, change: nil) }

    it { is_expected.not_to be_valid }
  end

  context 'whit the same changed product but different "on products"' do
    let!(:changed_product) { create(:product) }
    let!(:on_product) { create(:product) }
    let!(:another_on_product) { create(:product) }
    let!(:existing_price_change) { create(:price_change, changed_product:, on_product:) }

    subject(:price_change) { build(:price_change, changed_product:, on_product: another_on_product) }

    it { is_expected.to be_valid }
  end

  context 'whit the same "on product" but different changed products' do
    let!(:on_product) { create(:product) }
    let!(:changed_product) { create(:product) }
    let!(:another_changed_product) { create(:product) }
    let!(:existing_price_change) { create(:price_change, on_product:, changed_product:) }

    subject(:price_change) { build(:price_change, on_product:, changed_product: another_changed_product) }

    it { is_expected.to be_valid }
  end

  context 'whit the same changed product and the same "on product"' do
    let!(:on_product) { create(:product) }
    let!(:changed_product) { create(:product) }
    let!(:existing_price_change) { create(:price_change, on_product:, changed_product:) }

    subject(:price_change) { build(:price_change, on_product:, changed_product:) }

    it { is_expected.not_to be_valid }
  end
end
