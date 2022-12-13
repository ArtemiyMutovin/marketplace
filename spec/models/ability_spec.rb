require 'rails_helper'

RSpec.describe Ability, type: :model do
  subject(:ability) { described_class.new(user) }

  describe 'seller' do
    let(:user) { create :seller, company: company }
    let(:company) { create(:company) }

    it { is_expected.to be_able_to :manage, :all }
  end

  describe 'user' do
    let(:user) { create :buyer }

    it { is_expected.not_to be_able_to :manage, :all }
    it { is_expected.to be_able_to :read, :all }

    it { is_expected.to be_able_to :buy, Product }
  end
end
