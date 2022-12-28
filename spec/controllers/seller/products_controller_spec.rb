require 'rails_helper'

RSpec.describe Seller::ProductsController, type: :controller do
  let!(:other) { create :seller, :other, company: company }
  let(:company) { create(:company) }
  let(:product) { create :product, category: category, seller: other }
  let(:category) { create(:category) }

  describe 'GET #index' do
    let(:products) { create_list(:product, 3, seller: other, category: category) }

    before do
      sign_in(other)
      get :index
    end

    it 'populates an array of all products' do
      expect(assigns(:products)).to match_array(products)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before do
      sign_in(other)
      get :show, params: { id: product }
    end

    it 'assigns the requested product to @product' do
      expect(assigns(:product)).to eq product
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before do
      sign_in(other)
      get :new, params: { product_id: product }
    end

    it 'assigns the requested product to @product' do
      expect(assigns(:product)).to be_a_new(Product)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      sign_in(other)
      get :edit, params: { id: product }
    end

    it 'assigns the requested product to @product' do
      expect(assigns(:product)).to eq product
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    before do
      sign_in(other)
    end

    context 'with valid attributes' do
      it 'saves a new product in database' do
        expect { post :create, params: { product: attributes_for(:product) } }
          .to change(Product, :count).by(1)
      end

      it 'redirects to product' do
        post :create, params: { product: attributes_for(:product) }
        expect(response).to redirect_to seller_product_path(assigns(:product))
      end
    end

    context 'with invalid attributes' do
      it 'does not saves a new product in database' do
        expect { post :create, params: { product: attributes_for(:product, :invalid) } }
          .not_to change(Product, :count)
      end

      it 're-renders new view' do
        post :create, params: { product: attributes_for(:product, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before do
      sign_in(other)
    end

    context 'with valid attributes' do
      it 'assigns the requested product to @product' do
        patch :update, params: { id: product, product: attributes_for(:product) }
        expect(assigns(:product)).to eq product
      end

      it 'changes product attributes' do
        patch :update, params: { id: product, product: { title: 'new title' } }
        product.reload

        expect(product.title).to eq 'new title'
      end

      it 'redirects to product' do
        patch :update, params: { id: product, product: attributes_for(:product) }
        expect(response).to redirect_to seller_product_path(assigns(:product))
      end
    end

    context 'with invalid attributes' do
      it 'does not change product' do
        title = product.title
        patch :update, params: { id: product, product: attributes_for(:product, :invalid) }
        product.reload

        expect(product.title).to eq title
      end

      it 're-renders edit view' do
        patch :update, params: { id: product, product: attributes_for(:product, :invalid) }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:product) { create(:product, seller: other, category: category) }

    before do
      sign_in(other)
    end

    it 'deletes the product' do
      expect { delete :destroy, params: { id: product } }
        .to change(Product, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: product }
      expect(response).to redirect_to seller_products_path
    end
  end
end
