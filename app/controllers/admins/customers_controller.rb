class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admins_customer_path(customer)
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted )
  end

end
