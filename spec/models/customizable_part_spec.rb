require 'rails_helper'

RSpec.describe CustomizablePart, type: :model do
  subject(:customizable_part) { build(:customizable_part) }

  it { is_expected.to be_valid }
  
  context 'whit name not present' do
    subject(:customizable_part) { build(:customizable_part, name: "") }

    it { is_expected.not_to be_valid }
  end
  
  context 'whit description not present' do
    subject(:customizable_part) { build(:customizable_part, description: "") }

    it { is_expected.not_to be_valid }
  end
    
  context 'whit name already taken with the same parent' do
    let!(:another_category) { create(:customizable_part, name: "Duplicated name") }

    subject(:customizable_part) { build(:customizable_part, name: "Duplicated name") }

    it { is_expected.not_to be_valid }
  end
    
  context 'whit name already taken with different parent' do
    let!(:parent_category) { create(:customizable_part) }
    let!(:another_category) { create(:customizable_part, name: "Duplicated name", parent: parent_category) }

    subject(:customizable_part) { build(:customizable_part, name: "Duplicated name") }

    it { is_expected.to be_valid }
  end
end
