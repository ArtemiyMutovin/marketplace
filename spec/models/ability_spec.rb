require 'rails_helper'

RSpec.describe Ability, type: :model do
  subject(:ability) { described_class.new(user) }

  describe 'seller' do
    let(:user) { create :seller, company: company }
    let(:other) { create :seller, :other, company: company }
    let(:company) { create(:company) }
    let(:category) { create(:category) }
    let(:product) { create :product, seller: user, category: category, company: company }

    it { is_expected.not_to be_able_to :manage, :all }

    it { is_expected.to be_able_to :update, create(:product, seller: user, company: company), seller: user }
    it { is_expected.not_to be_able_to :update, create(:product, seller: other, company: company), seller: user }

    it { is_expected.to be_able_to :destroy, create(:product, seller: user, company: company), seller: user }
    it { is_expected.not_to be_able_to :destroy, create(:product, seller: other, company: company), seller: user }
  end

  describe 'user' do
    let(:user) { create :buyer }

    it { is_expected.not_to be_able_to :manage, :all }
    it { is_expected.to be_able_to :read, :all }

    it { is_expected.to be_able_to :buy, Product }
  end
end
