require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validate user uniqueness' do
    let!(:user) { create(:user) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
end
