require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  let!(:other) { create :seller, :other, company: company }
  let(:company) { create(:company) }
  let(:product) { create :product, category: category, seller: other, company: company }
  let(:category) { create(:category) }

  describe 'GET #index' do
    let(:companies) { create_list(:company, 3) }

    before do
      allow(Company).to receive(:all).and_return(companies)
      get :index
    end

    it 'populates an array of all companies' do
      expect(assigns(:companies)).to match_array(companies)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before do
      get :show, params: { id: company }
    end

    it 'assigns the requested company to @company' do
      expect(assigns(:company)).to eq company
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before do
      get :new, params: { company_id: company }
    end

    it 'assigns the requested company to @company' do
      expect(assigns(:company)).to be_a_new(Company)
    end

    it 'assigns the requested Company seller to @company.sellers' do
      expect(assigns(:company).sellers.first).to be_a_new(Seller)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves a new company in database' do
        expect { post :create, params: { company: attributes_for(:company) } }
          .to change(Company, :count).by(1)
      end

      it 'redirects to company' do
        post :create, params: { company: attributes_for(:company) }
        expect(response).to redirect_to company_path(assigns(:company))
      end
    end

    context 'with invalid attributes' do
      it 'does not saves a new company in database' do
        expect { post :create, params: { company: attributes_for(:company, :invalid) } }
          .not_to change(Company, :count)
      end

      it 're-renders new view' do
        post :create, params: { company: attributes_for(:company, :invalid) }
        expect(response).to render_template :new
      end
    end
  end
end
