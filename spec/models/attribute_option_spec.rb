require 'rails_helper'

RSpec.describe AttributeOption, type: :model do
  subject(:attribute_option) { build(:attribute_option) }

  it { is_expected.to be_valid }

  context 'whit name not present' do
    subject(:attribute_option) { build(:attribute_option, name: "") }

    it { is_expected.not_to be_valid }
  end

  context 'whit description not present' do
    subject(:attribute_option) { build(:attribute_option, description: "") }

    it { is_expected.not_to be_valid }
  end

  context 'whit name already taken for the same customizable attribute' do
    let!(:customizable_attribute) { create(:customizable_attribute) }
    let!(:another_attribute_option) { create(:attribute_option, name: "Duplicated name", customizable_attribute:) }

    subject(:attribute_option) { build(:attribute_option, name: "Duplicated name", customizable_attribute:) }

    it { is_expected.not_to be_valid }
  end

  context 'whit the same name but in different customizable attribute' do
    let!(:customizable_attribute) { create(:customizable_attribute) }
    let!(:another_customizable_attribute) { create(:customizable_attribute) }
    let!(:another_customizable_part) { create(:attribute_option, name: "Duplicated name", customizable_attribute:) }

    subject(:attribute_option) { build(:attribute_option, name: "Duplicated name", customizable_attribute: another_customizable_attribute) }

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
