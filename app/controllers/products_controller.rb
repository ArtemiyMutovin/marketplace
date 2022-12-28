class ProductsController < ApplicationController
  before_action :authenticate_user!, unless: :devise_controller?

  authorize_resource

  def index
    @products = Product.all
  end

  def buy; end
end
