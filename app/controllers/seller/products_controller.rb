class Seller::ProductsController < ApplicationController
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :find_product, only: %i[show edit update destroy]
  before_action :set_product, only: %i[show edit update destroy]

  authorize_resource

  def index
    @products = current_user.products
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    @product.seller_id = @current_user.id

    if @product.save
      redirect_to seller_product_path(@product)
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to seller_product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to seller_products_path
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :category_id, :seller_id)
  end
end
