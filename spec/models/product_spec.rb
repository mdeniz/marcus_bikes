# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  base_price      :decimal(10, 2)
#  brand           :string
#  customizable    :boolean          default(FALSE)
#  description     :string
#  enabled         :boolean          default(FALSE)
#  image           :string
#  model           :string
#  stock_available :boolean          default(FALSE)
#  uuid            :string
#  year            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer          not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#  unique_uuid_on_products        (uuid) UNIQUE
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
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
      subject(:product) { build(:product, base_price: nil) }

      it { is_expected.not_to be_valid }
    end

    context 'whit negative standalone price' do
      subject(:product) { build(:product, base_price: -1) }

      it { is_expected.not_to be_valid }
    end

    context 'whit standalone price wrongly formatted' do
      subject(:product) { build(:product, base_price: "bad number") }

      it { is_expected.not_to be_valid }
    end

    context 'whit uuid not present it generates one' do
      let(:uuid_regex) { /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/ }

      subject(:product) { create(:product, uuid: nil) }

      it { expect(product.uuid).not_to be_nil }
      it { expect(product.uuid).to match(uuid_regex) }
    end
  end

  describe "#incompatible_products" do
    let!(:product) { create(:product) }
    let!(:another_product) { create(:product) }

    subject(:incompatible_products) { product.incompatible_products }

    context "with banned combination as source" do
      let!(:banned_combinations) { create(:banned_combination, source: product, target: another_product) }

      it { expect(incompatible_products).to include(another_product) }
    end

    context "with banned combination as target" do
      let!(:banned_combinations) { create(:banned_combination, source: another_product, target: product) }

      it { expect(incompatible_products).to include(another_product) }
    end
  end

  describe "#incompatible_products_ids" do
    let!(:product) { create(:product) }
    let!(:another_product) { create(:product) }

    subject(:incompatible_products_ids) { product.incompatible_products_ids }

    context "with banned combination as source" do
      let!(:banned_combinations) { create(:banned_combination, source: product, target: another_product) }

      it { expect(incompatible_products_ids).to include(another_product.id) }
    end

    context "with banned combination as target" do
      let!(:banned_combinations) { create(:banned_combination, source: another_product, target: product) }

      it { expect(incompatible_products_ids).to include(another_product.id) }
    end
  end

  describe "#price" do
    let!(:product) { create(:product, base_price: 10) }

    subject(:product_selection_price) { product.price(selected_attribute_option_ids:, selected_part_option_ids:) }

    context "only attributes selected" do
      let!(:customizable_attribute) { create(:customizable_attribute) }
      let!(:attribute_option) { create(:attribute_option, price_change: 0, customizable_attribute:) }
      let!(:ignorable_attribute_option) { create(:attribute_option, price_change: 3) }

      let(:selected_attribute_option_ids) { [ attribute_option.id ] }
      let(:selected_part_option_ids) { [] }

      context "without price changes" do
        it { is_expected.to eq(10) }
      end

      context "with price changes" do
        let!(:another_attribute_option) { create(:attribute_option, price_change: 5, customizable_attribute:) }
        let(:selected_attribute_option_ids) { [ attribute_option.id, another_attribute_option.id ] }

        it { is_expected.to eq(15) }
      end
    end

    context "only parts selected" do
      let!(:another_product) { create(:product, base_price: 5) }
      let!(:product_not_in_selection) { create(:product, base_price: 1) }
      let!(:ignorable_price_change) { create(:price_change, changed_product: product, on_product: product_not_in_selection, change: 700) }

      let(:selected_attribute_option_ids) { [] }
      let(:selected_part_option_ids) { [ product.id, another_product.id ] }

      context "without price changes" do
        it { debugger; is_expected.to eq(15) }
      end

      context "with price changes" do
        let!(:price_change_in_selection) { create(:price_change, changed_product: product, on_product: another_product, change: 3) }
        let(:another_product_selection_price) { another_product.price(selected_part_option_ids:, selected_attribute_option_ids:) }

        it { is_expected.to eq(18) }
        it { expect(another_product_selection_price).to eq(18) }
      end
    end
  end
end
