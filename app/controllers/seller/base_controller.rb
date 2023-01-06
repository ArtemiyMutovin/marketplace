class Seller::BaseController < ApplicationController
  layout 'seller'

  before_action :authenticate_user!, unless: :devise_controller?
  before_action :seller_required!

  private

  def seller_required!
    redirect_to root_path, alert: 'You are not authorized to view this page!' unless current_user.is_a?(Seller)
  end
end
