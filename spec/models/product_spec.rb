require 'rails_helper'

RSpec.describe Product, type: :model do
  subject(:product) { build(:product) }

  it { is_expected.to be_valid }

  context 'whit brand not present' do
    subject(:product) { build(:product, brand: "") }

    it { is_expected.not_to be_valid }
  end

  context 'whit model not present' do
    subject(:product) { build(:product, model: "") }

    it { is_expected.not_to be_valid }
  end

  context 'whit description not present' do
    subject(:product) { build(:product, description: "") }

    it { is_expected.not_to be_valid }
  end

  context 'whit standalone price not present' do
    subject(:product) { build(:product, standalone_price: nil) }

    it { is_expected.not_to be_valid }
  end

  context 'whit negative standalone price' do
    subject(:product) { build(:product, standalone_price: -1) }

    it { is_expected.not_to be_valid }
  end

  context 'whit standalone price wrongly formatted' do
    subject(:product) { build(:product, standalone_price: "bad number") }

    it { is_expected.not_to be_valid }
  end

  context 'whit uuid not present it generates one' do
    let(:uuid_regex) { /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/ }

    subject(:product) { create(:product, uuid: nil) }

    it { expect(product.uuid).not_to be_nil }
    it { expect(product.uuid).to match(uuid_regex) }
  end
end
