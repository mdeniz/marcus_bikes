# == Schema Information
#
# Table name: attribute_options
#
#  id                        :integer          not null, primary key
#  description               :string
#  name                      :string
#  order                     :integer          default(1)
#  price_change              :decimal(10, 2)   default(0.0)
#  stock_available           :boolean          default(FALSE)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  customizable_attribute_id :integer          not null
#
# Indexes
#
#  index_attribute_options_on_customizable_attribute_id  (customizable_attribute_id)
#
# Foreign Keys
#
#  customizable_attribute_id  (customizable_attribute_id => customizable_attributes.id)
#
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
