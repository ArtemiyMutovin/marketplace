require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:user) { create(:buyer) }
  let!(:other) { create :seller, :other, company: company }
  let(:company) { create(:company) }
  let(:category) { create(:category) }

  describe 'GET #index' do
    let(:products) { create_list(:product, 3, category: category, seller: other) }

    before do
      sign_in(user)
      get :index
    end

    it 'populates an array of all products' do
      expect(assigns(:products)).to match_array(products)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
