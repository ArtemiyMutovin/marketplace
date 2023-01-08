require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  let!(:other) { create :seller, :other, company: company }
  let(:company) { create(:company) }
  let(:product) { create :product, category: category, seller: other, company: company }
  let(:category) { create(:category) }

  describe 'GET #show' do
    before do
      get :show, params: { id: product }
    end

    it 'assigns the requested company to @company' do
      expect(assigns(:company)).to eq company
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end
