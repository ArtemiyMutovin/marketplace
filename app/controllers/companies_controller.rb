class CompaniesController < ApplicationController
  before_action :company, only: %i[show]
  def show; end

  private

  def company
    @company = Company.find(params[:id])
  end
end
