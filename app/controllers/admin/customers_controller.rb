class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customers = Costomer.find(params[:id])
  end

  def edit
    @customers = Costomer.find(params[:id])
  end

  def update
    @customers = Costomer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render edit_customer_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :is_valid_status)
  end


end
