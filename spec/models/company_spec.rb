require 'rails_helper'

RSpec.describe Company, type: :model do
  it { is_expected.to have_many(:products).dependent(:destroy) }
  it { is_expected.to have_many(:sellers).dependent(:destroy) }

  it { is_expected.to accept_nested_attributes_for :sellers }

  it { is_expected.to validate_presence_of :name }

  describe 'validate user uniqueness' do
    let!(:company) { create(:company) }

    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
