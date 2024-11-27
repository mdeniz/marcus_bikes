require 'rails_helper'

RSpec.describe Category, type: :model do
  subject(:category) { build(:category) }

  it { is_expected.to be_valid }
  
  context 'whit name not present' do
    subject(:category) { build(:category, name: "") }

    it { is_expected.not_to be_valid }
  end
  
  context 'whit description not present' do
    subject(:category) { build(:category, description: "") }

    it { is_expected.not_to be_valid }
  end
    
  context 'whit name already taken with the same parent' do
    let!(:another_category) { create(:category, name: "Duplicated name") }

    subject(:category) { build(:category, name: "Duplicated name") }

    it { is_expected.not_to be_valid }
  end
    
  context 'whit name already taken with different parent' do
    let!(:parent_category) { create(:category) }
    let!(:another_category) { create(:category, name: "Duplicated name", parent: parent_category) }

    subject(:category) { build(:category, name: "Duplicated name") }

    it { is_expected.to be_valid }
  end
end
