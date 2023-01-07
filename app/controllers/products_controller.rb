class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def buy; end
end
