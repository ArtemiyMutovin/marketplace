class CompaniesController < ApplicationController
  before_action :company, only: %i[show]

  def index
    @companies = Company.all
  end

  def show; end

  def new
    @company = Company.new
    @company.sellers.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  private

  def company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, sellers_attributes: %i[email first_name last_name password])
  end
end
